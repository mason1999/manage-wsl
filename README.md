# Prerequisites

Ensure that you have a clean installation of the verison of linux you want to use. To do this, do something like:

```
wsl --install Ubuntu-22.04
```

# Summary of usage

Note that when you see `testuser` throughout the markdown file, it is reccomended you replace the name with the name of a user which is already created when you did the `wsl --install Ubuntu-22.04` command. For example "jake".

## Creating a Development envrionment

To create a new environment, the general form of the command is:

```
.\manage-wsl.ps1 -target_distribution <source distro> -instance_name <distro to be made> -wsl_instances_path <path of folder to mount distro> -create
```

For example, to create a new development environment from an existing `Ubuntu-22.04` image:

```
.\manage-wsl.ps1 -target_distribution Ubuntu-22.04 -instance_name clean-ubuntu-22.04 -wsl_instances_path C:\Users\testuser\OneDrive\Desktop\wsl-instances -create
```

Then you could do some configuration with `clean-ubuntu-22.04` like configuring the `wsl.conf` file to make it easier to work with (or whatever configuration you want). For example:

```
[automount]
options = "metadata,uid=1000"

[user]
default = testuser

[boot]
systemd = true
```

Then you could run the script again with `clean-ubuntu-22.04` as the `target_distribution`

```
.\manage-wsl.ps1 -target_distribution clean-ubuntu-22.04 -instance_name dev1 -wsl_instances_path C:\Users\testuser\OneDrive\Desktop\wsl-instances -create
```

## Deleting a Development envrionment

To delete an existing environment, the general form of the command is:

```
.\manage-wsl.ps1 -instance_name <distro to be deleted> -wsl_instances_path <path of mounted folder> -delete
```

For example:

```
.\manage-wsl.ps1 -instance_name dev1 -wsl_instances_path C:\Users\testuser\OneDrive\Desktop\wsl-instances -delete
```

and:

```
.\manage-wsl.ps1 -instance_name dev1 -wsl_instance_path C:\Users\testuser\OneDrive\Desktop\wsl-instances -delete
```
