Objective
---------

We will be using the cluster a lot this term, so the sooner you are able
to log in the better. If you run into problems, check out the
troubleshooting section below or [drop me an
email](mailto:johnson@hood.edu).

On a Mac or Linux
-----------------

-   Open `Terminal.app`
-   Type `ssh <your_user_name>@144.175.88.21`
    -   where `<your_user_name>` is your Hood username. For example, if
        my user name were ‘slm6n’ I would type

`ssh slm6n@144.175.88.21`

-   Enter your password (not the same as your regular Hood account).

On Windows or Chromebook
------------------------

There are several ways you can do this, but the easiest way I know of is
using the Secure Shell extention on Chrome.

-   Install the Secure Shell extension on your Chrome browser.
-   Once enabled, click on the secure shell icon in the tool bar and
    select `Connection Dialog`
-   Enter your Hood username in the user name field.
-   Enter ‘144.175.88.21’ in the host name field.
-   Once you have created the connection (you may need to click in the
    freeform field), hit the connect button on the bottom right.
-   Enter your password (not the same as your regular Hood account).

Mobile Connections
------------------

There are also mobile apps you can use to connect to the cluster. Given
the amount of typing required, I wouldn’t recommend this unless you have
a keyboard, but even without a keyboard it can work in a pinch. If you
do want to connect from a mobile device, I have found that the Termius
app works well and is available on both Google and Apple app stores. You
will need the following to set up the connection for the first time.
After that, you can save the connection and tap to log in.

-   Host name: 144.175.88.21
-   Hood user name
-   Password (not the same as your regular Hood account)

Troubleshooting
---------------

Here are some common problems that students have run into. I’ll keep
updating this list if I notice any other trends.

-   Password doesn’t work
    -   [Send me an email](mailto:johnson@hood.edu), and we’ll reset
        your password.
-   You get a warning that starts out “WARNING: REMOTE HOST
    IDENTIFICATION HAS CHANGED!”
    -   This happens when the server has had a major upgrade since the
        last time you logged in. This is a safety feature that prevents
        you from logging into a server that is pretending to be the
        server you normally log into. If you have been logging in
        frequently and you get this warning unexpectedly, you should
        probably check with me or the system administrator before
        logging in.
    -   If you are using a terminal window (Mac or Linux), open the file
        called `~/.ssh/known_hosts` and remove the line that starts with
        `144.175.88.21`.
    -   If you are using the Chrome app or a mobile app, delete the
        saved connection and set it up again.
