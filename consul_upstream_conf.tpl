{{range services}}
    {{$name := .Name}} 
    {{$service := service .Name}}
    {{if eq .Name "consul"}}{{else}}

        {{with service .Name}}
            {{with index . 0}}

                {{ $upstream := .NodeMeta.upstream}}

                 upstream {{$upstream}} {
                    {{range $service}}
                    server {{.Address}}:{{.Port}} max_fails=3 fail_timeout=10 weight=1;{{end}}
                }

            {{end}}
        {{end}}

    {{end}}
{{end}}
