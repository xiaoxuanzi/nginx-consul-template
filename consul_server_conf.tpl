server {
    listen 1234;
{{range services}}

    {{if ne .Name "consul" }}
        name -- {{ .Name }}
        {{range $i, $s := service .Name}}
            {{if eq $i 0 }}
                location /{{ .NodeMeta.location }}{
                    proxy_pass http://{{ .NodeMeta.upstream }};
                }
            {{end}}
        {{end}}

    {{end}}

{{end}}
}

