def t [t: path] {
    let type = $t | path parse | get extension
    let template: path = "~/.config/nushell/templates/template." + $type | path expand

    # File exist
    if ($t | path expand | path exists) {
        match $type {
            "typ" => {
                typst compile $t
                let pdf = ($t | path parse | get stem) + (".pdf")
                start $pdf
            },
        }
        nvim $t
        return
    }

    # File does not
    if ($template | path exists) {
        cp $template $t
        match $type { 
            "typ" => {
                typst compile $t
                let pdf = ($t | path parse | get stem) + (".pdf")
                start $pdf
            },
        }
        nvim $t
        return
    } else {
        print $"no template for filetype: '($type)'"
        touch $t
        return $t
    }
}
