[Automatically] Standup a local Jenkins instance 

This jenkins instance is only meant for use development. There's no
real credientials, no ordinary users and it expects to mount secrets
from your $HOME.

It does, however, rely on CASC[1] for a hands-off deployment.

Stand the instance up via:

    $ make

[1] https://github.com/jenkinsci/configuration-as-code-plugin

Once the instance it up you can access it at:

    http://127.0.0.1:8080/
