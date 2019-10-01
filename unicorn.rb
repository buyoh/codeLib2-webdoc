worker_processes 1
#working_directory "/my/nice/path" # 記載しておけば他のディレクトリでこのファイルを叩けなくなる
preload_app true
timeout 8
Dir.mkdir 'tmp' unless Dir.exists? ('tmp')
Dir.mkdir 'tmp/pids' unless Dir.exists? ('tmp/pids')
Dir.mkdir 'log' unless Dir.exists? ('log')
listen File.expand_path("./tmp/sockets.sock"), :backlog => 64
pid File.expand_path("./tmp/pids/unicorn.pid")
stderr_path File.expand_path("./log/unicorn.stderr.log")
stdout_path File.expand_path("./log/unicorn.stdout.log")