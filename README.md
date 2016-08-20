# contact-backup-restore

In order to be able to run this rspec test script, following is required:

1\. Install RVM

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
```
2\. Install ruby 2.1.3
```
rvm install 2.1.3
```
3\. Clone the repository

4\. Install gems from Gemfile

Once repository cloned, go to __test/functional/rspec__ and execute following:
```
gem install bundler -v 1.12.5
bundle install
```
5\. Ensure Firefox web browser is installed on machine where the test script is going to be run

6\. Run the test script
```
ENV_NAME=TEST_ENV bundle exec rspec ./spec/backup_restore_spec.rb
```
