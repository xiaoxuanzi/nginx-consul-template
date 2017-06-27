{{range services}}
    {{$service := service .Name}}
    {{if ne .Name "consul"}}
        {{range $i, $s := service .Name}}
            {{if eq $i 0 }}
                {{ $upstream := .NodeMeta.upstream}}
                 upstream {{$upstream}} {
                    {{range $service}}
                    server {{.Address}}:{{.Port}} max_fails=3 fail_timeout=10 weight=1;{{end}}
                }
            {{end}}

        {{end}}

    {{end}}
{{end}}
