# PicoCTF Write-Ups 2026

## Environment

These challenges were completed on a HP laptop running windows with an i9.
For access to tooling better suited to forensic and pentesting work, I used a Kali XFCE virtual machine, especially for challenges involving SSH or other remote access.

## General Skills

## SUDO MAKE ME A SANDWICH

Points: 50

Summary:
Can the flag be read, and if so, how?

Notes:
I ran ls -la to inspect the directory contents and found flag.txt, but elevated permissions were required to read it. Running sudo -l showed that emacs could be executed as root. Using that privilege, I opened the file with sudo emacs flag.txt and retrieved the flag.

## Piece by Piece

Points: 50

Summary:
After logging in, multiple file fragments are present in the home directory. These parts must be combined to recover the flag.

Notes:
I found several numbered files in the home directory and used cat file* > flag.txt to combine them into a single output, which revealed the flag. Note: file* is a placeholder for the actual file names.

## Password Profiler

Points: 100

Summary:
Using OSINT-style personal details about a target, generate a custom password list and recover the original password by matching its hash.

Notes:
Personal information was provided in userinfo.txt. I used those details with CUPP to generate a targeted wordlist, then used that list to crack the provided password hash with the provided check_password script.
