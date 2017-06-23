server {
    listen 1234;
{{range services}}

    {{if eq .Name "consul" }}
    {{else}}
        {{with service .Name}}
            {{with index . 0}}

                {{ $location := .NodeMeta.location}}
                {{ $upstream := .NodeMeta.upstream}}

                location /{{ $location }}{
                    proxy_pass http://{{ $upstream }};
            }
            {{end}}
        {{end}}
    {{end}}

{{end}}
}

