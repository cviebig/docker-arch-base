# archlinux
# VERSION 0.1.6
#
# A fully updated Arch Linux base image

FROM base/archlinux
MAINTAINER Logan Koester <logan@logankoester.com>

RUN curl -o /etc/pacman.d/mirrorlist "https://www.archlinux.org/mirrorlist/?country=DE&use_mirror_status=on" && \
  sed -i 's/^#//' /etc/pacman.d/mirrorlist

RUN sed 's/^CheckSpace/#CheckSpace/g' -i /etc/pacman.conf && \
 pacman-key --refresh-keys && \
 pacman -Sy --noprogressbar --noconfirm && \
 pacman -S --force openssl --noconfirm && \
 pacman -S pacman --noprogressbar --noconfirm && \
 pacman-db-upgrade && \
 pacman -Syyu --noprogressbar --noconfirm && \
 pacman -Scc --noconfirm && \
 rm -rf /usr/share/man/* && \
 sed 's/^#CheckSpace/CheckSpace/g' -i /etc/pacman.conf

