def t [t: path] {
    let type = $t | path parse | get extension
    let template: path = "~/.config/nushell/templates/template." + $type | path expand
    if ($template | path exists) {
        cp $template $t
        return $t
    } else {
        print $"no template for filetype: '($type)'"
        touch $t
        return $t
    }
}
