def t [t: path] {
    let type = $t | path parse | get extension
    let template: path = "~/.config/nushell/templates/template." + $type | path expand
    if ($template | path exists) {
        cp $template $t
        match $type { 
            "typ" => {
                typst compile $t
                let pdf = ($t | path parse | get stem) + (".pdf")
                start $pdf
            },
        }
        return $t
    } else {
        print $"no template for filetype: '($type)'"
        touch $t
        return $t
    }
}
