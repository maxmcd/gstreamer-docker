images = []
versions = `ls -d */`.split("\n")

def run(cmd) 
    puts cmd
    system(cmd)
end

versions.each do |version|
    images += `ls #{version}`.split("\n").map{|a| version+a }
end
images.each do |image|
    run("docker build -t maxmcd/gstreamer:#{image.gsub("/", "-")} #{image}")
    run("docker push maxmcd/gstreamer:#{image.gsub("/", "-")}")
end

run("docker tag maxmcd/gstreamer:1.14-buster maxmcd/gstreamer:latest")
run("docker push maxmcd/gstreamer:latest")
