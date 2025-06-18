**1) Baixar a imagem cloud-init para usar como template no Proxmox:**
- wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img -O ubuntu-cloudimg.img

**2) Subir a imagem acima para o Proxmox:**
- qm create 9000 --name ubuntu-cloudinit --memory 2048 --net0 virtio,bridge=vmbr0
- qm importdisk 9000 ubuntu-cloudimg.img local-lvm
- qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-0
- qm set 9000 --ide2 local-lvm:cloudinit
- qm set 9000 --boot order=scsi0
- qm set 9000 --serial0 socket --vga serial0
- qm set 9000 --agent enabled=1

**3) Transformar a imagem, já criada como VM, para template:**
- qm template 9000

**4) Referenciar o nome do template no main.tf**

**5) Comandos para rodar o Terraform na máquina local:**
- terraform init\
- terraform plan\
- terraform apply

**6) Após o comando "terraform apply", rodar:**\
- nix run github:nix-community/nix-anywhere -- --flake .#<hostname> root@<ip-da-vm>

**7) Estrutura do diretório:**\
![image](https://github.com/user-attachments/assets/1f61be3c-a306-42bc-bb95-9ef31f4e2c45)

