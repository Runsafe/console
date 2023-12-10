# Setup
For this to work, some system modifications are necessary

## Administrative group
```
groupadd minecraft
usermod -G minecraft username
```

## Creating server accounts
```
useradd -g minecraft server1
useradd -g minecraft server2
useradd -g minecraft server3
useradd -g minecraft server4
```

## Creating staff users
Note the uppercase `-G`, it adds the user to the group rather than setting it as their primary group.
```
useradd -G minecraft dog
```

## sudo access
Create a file in /etc/sudoers.d and add this content:

```
%minecraft ALL=(server1) NOPASSWD: ALL
%minecraft ALL=(server2) NOPASSWD: ALL
%minecraft ALL=(server3) NOPASSWD: ALL
%minecraft ALL=(server4) NOPASSWD: ALL
```

Now any member of the `minecraft` group should have access to run any command as the server users.

To drop into the server shells, the `server1` through `server4` commands use sudo to launch a shell as the respective users

## Console access
The commands `s1`, `s2`, `s3`, `s4` as well as `c1`, `c2`, `c3`, `c4` all simply execute mc-console with two arguments.

The first argument is the name of the server to open the console for, the second is which screen layout to use.

When you execute `s1` it will us the split layout for the console, while `c1` will use the combined layout.

### Custom console layout
Layouts can be customized by editing the `shell.split` and `shell.combine` files in the server home directory, but it will affect all users.
If you want/need something custom, feel free to copy one of the `shell.*` files to some new name and use `mc-console` directly to launch that layout.
