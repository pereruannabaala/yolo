Vagrant.configure("2") do |config|
  config.vm.provider "docker" do |d|
    d.image = "ubuntu:20.04"
    d.has_ssh = true
    d.cmd = ["sleep", "infinity"]   # keep the container running
  end

  config.vm.network "forwarded_port", guest: 3000, host: 3001
  config.vm.network "forwarded_port", guest: 5000, host: 5001


  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
