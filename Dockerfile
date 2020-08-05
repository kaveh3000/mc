FROM busybox
LABEL volume to set up MC run scripts on a newly created cloud VM
COPY . /source
CMD ["sh", "-c", "tar cf - . -C /source|tar xf - -C /setup"]
