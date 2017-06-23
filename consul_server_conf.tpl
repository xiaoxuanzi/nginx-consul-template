server {
    listen 1234;
{{range services}} {{$name := .Name}}{{if eq .Name "consul" }}{{else}}
    location /{{$name}} {
        proxy_pass http://{{$name}};
    }{{end}}{{end}}
}

