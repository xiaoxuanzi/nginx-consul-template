{{range services}} {{$name := .Name}} {{$service := service .Name}}{{if eq .Name "consul"}}{{else}}
upstream {{$name}} {
    {{range $service}}server {{.Address}}:{{.Port}} max_fails=3 fail_timeout=10 weight=1;{{end}}
}{{end}}
{{end}}
