<h1>Workflow para usar CI/CD pelo GitHub Actions</h1>

**<h3>Ter um arquivo deploy.yml para:</h3>**
- Rodar Terraform
- Pegar IP da VM
- Executar nix-anywhere com a flake

**<h3>Requisitos para funcionar o deploy</h3>**
- Usar o Tailscale em ambas as pontas (Proxmox e GitHub)
- Ter o GitHub Runner rodando dentro da máquina local

**<h3>Variáveis necessárias:</h3>**
- PROXMOX_HOST → IP ou domínio do Proxmox
- PROXMOX_USER → root@pam ou api@pve
- PROXMOX_PASSWORD ou PROXMOX_API_TOKEN
- SSH_PRIVATE_KEY → chave para login SSH via root
- SSH_PUBLIC_KEY → injetada no cloud-init e flake
