{{range services}}{{$service := service .Name}}{{if ne .Name "consul"}}{{range $i, $s := service .Name}}{{if eq $i 0 }}{{if eq .NodeMeta.domain "ops.mrd.sohuno.com"}}
upstream {{.NodeMeta.upstream}} { {{range $service}}
    server {{.Address}}:{{.Port}} max_fails=3 fail_timeout=10 weight=1;{{end}}
}{{end}}{{end}}{{end}}{{end}}{{end}}
