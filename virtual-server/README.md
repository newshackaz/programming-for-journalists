# Programming for Journalists

## Virtual Server

Some virtual server providers

* [Cloud 9](http://c9.io)
* [Digital Ocean](https://www.digitalocean.com/)
* more

For the class we'll use Digital Ocean

### Get started

* Open https://www.digitalocean.com/
* Click `Sign Up`
* Provide an email and password
* Click `Sign Up`

### Create a new droplet

* From the Digital Ocean Dashboard click `Create Droplet`
* Under `Choose and image` make sure Ubuntu is highlighted
* Under `Choose a size` highlight the $5/mo option
* `Choose a datacenter region` that is closest to you or your site visitors
* Skip `Select additional options`
* Skip `Add your SSH keys`
* Under `Finalize and create` give your droplet a hostname
  * The hostname appears in the Digital Ocean dashboard as well as the server hosts file
  * No spaces are allowed, use all lowercase letters
  * Dashes are allowed if you want to separate words
* Click on `Create`
* In less than a minute your virtual server should be ready

### Login to your server

* You will need three pieces of info to get logged in
  * The default username which is **root**
  * The IP address of your server
  * The **root** password that was emailed to you after your droplet was created
* Windows users should download PuTTY
  * PuTTY can be found on their [download page](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)
  * Run putty.exe and use the three pieces of info above to open a new connection
  * If you see a warning about the host authenticity, answer *yes*
* Mac users have an ssh client already installed
  * Open a *Terminal* window
  * Type `ssh root@your-server-ip-address`, press `Return`
  * If you see a warning about the host authenticity, type `yes` and press `Return`
  * Enter the *root* password when prompted
  * Digital Ocean requires that the password be changed
    * Enter the current root password
    * Enter a new root password
    * Re-enter the new root password

### Preparing your server for use

* If all went well you should be sitting at a UNIX *root* prompt
* Update the list of available packages
  * Type `apt-get update`, then press `Return`
* Apply any updates to the system
  * Type `apt-get upgrade`, then press `Return`
  * Answer `Y`, then press `Return`
* Let's install the software we are going to need
  * To install the web server called Apache
    * Type `apt-get install apache2`, then press `Return`
    * Answer `Y`, then press `Return`
    * To verify that your web server is up and running open a new browser tab and visit http://your-server-ip-address
    * You should see the *Apache2 Ubuntu Default Page*
  * To install the Ruby language
    * Type `apt-get install ruby ruby-dev`, then press `Return`
    * Answer `Y`, then press `Return`
    * To verify that Ruby was installed type `ruby -v`, then press `Return`

### Creating a new user account

* The *root* user has special permissions and as such we shouldn't be using it for everyday use
* Type `adduser your-username`, then press `Return`
  * Your username should be one word, lowercase
* You will be prompted through the process
