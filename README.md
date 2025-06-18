<h1>Roteiro inicial de configuração do Proxmox e Terraform</h1>

**<h3>1) Baixar a imagem cloud-init para usar como template no Proxmox:</h3>**
```wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img```

**<h3>2) Subir a imagem acima para o Proxmox:</h3>**
```qm create 9000 --name ubuntu-cloudinit --memory 2048 --net0 virtio,bridge=vmbr0```\
```qm importdisk 9000 ubuntu-cloudimg.img local-lvm```\
```qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-0```\
```qm set 9000 --ide2 local-lvm:cloudinit```\
```qm set 9000 --boot order=scsi0```\
```qm set 9000 --serial0 socket --vga serial0```\
```qm set 9000 --agent enabled=1```

**<h3>3) Transformar a imagem, já criada como VM, para template:</h3>**
```qm template 9000```

**<h3>4) Referenciar o nome do template no main.tf</h3>**

**<h3>5) Comandos para rodar o Terraform na máquina local:</h3>**
```terraform init```\
```- terraform plan```\
```- terraform apply```

**<h3>6) Após o comando "terraform apply", rodar:</h3>**
```- nix run github:nix-community/nix-anywhere -- --flake .#<hostname> root@<ip-da-vm>```


<h1>Workflow para usar CI/CD pelo GitHub Actions</h1>

**<h3>1) Ter um arquivo deploy.yml para:</h3>**
```- Rodar Terraform```\
```- Pegar IP da VM```\
```- Executar nix-anywhere com a flake```

**<h3>2) Requisitos para funcionar o deploy</h3>**
```- Usar o Tailscale em ambas as pontas (Proxmox e GitHub)```\
```- Ter o GitHub Runner rodando dentro da máquina local```

**<h3>3) Variáveis necessárias:</h3>**
```- PROXMOX_HOST → IP ou domínio do Proxmox```\
```- PROXMOX_USER → root@pam ou api@pve```\
```- PROXMOX_PASSWORD ou PROXMOX_API_TOKEN```\
```- SSH_PRIVATE_KEY → chave para login SSH via root```\
```- SSH_PUBLIC_KEY → injetada no cloud-init e flake```
