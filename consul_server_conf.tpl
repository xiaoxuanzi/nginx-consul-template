server {
    listen 1234;
{{range services}}{{if ne .Name "consul" }}{{range $i, $s := service .Name}}{{if eq $i 0 }}{{if eq .NodeMeta.domain "ops.mrd.sohuno.com"}}
    location /{{ .NodeMeta.location }}{
        proxy_pass http://{{ .NodeMeta.upstream }};
    }{{end}}{{end}}{{end}}{{end}}{{end}}
}

