[Automatically] Standup a local Jenkins instance using [JCasC](https://github.com/jenkinsci/configuration-as-code-plugin)

This jenkins instance is only meant for local development. There's no
real credientials, no real split between an admin user and a non-admin
user. And it also expects to mount secrets from your $HOME directory.

It does, however, rely on
[JCasC](https://github.com/jenkinsci/configuration-as-code-plugin) for
a hands-off configuration and repeatable deployments.

## Build/Run

Stand the local instance up via:

	$ make

Once the instance it up you can access it at:

	http://127.0.0.1:8080/

## Motivation

The real goal of setting up a local Jenkins instance was to
create/capture (freestyle) jobs defined using jenkins job builder. I
have done this in the past but futzing with the Jenkins configuration
was a labour of love and that ultimately became non-reproducible over
time. This was my first experiment using CasC - which seems to work
quite nicely.

## Usage

Quite often I start something in a terminal that I a) want to
reproduce at a later date and b) I want to record the output whilst
getting on with other things. Using Jenkins forces me to create better
(and more reusable) shell scripts but it also provides an ongoing way
to continuously automate and capture/record the job output.

### Sample job

Submit all the jobs using:

	$ make submit-jobs

And then use `Build Now` in the Jenkins console to run it. The sample
job verifies that `gcloud` is authenticated without storing any
credentials in Jenkins. The Google cloud credientials are simply
mapped as a volume when the container runs.
