# Secret Bambino

[New Bamboo](https://www.new-bamboo.co.uk) style [Secret Santa](http://en.wikipedia.org/wiki/Secret_Santa).

## Synopsis

This is a little command line app to randomly assign participating Bambinos to Secret Santas (Secret Bambinos), and email them (the Secret Bambinos) their assignments.  It uses ERB to render the email messages, and the SMTP server associated with your GMail (or Google Apps) account to send them.

## Setup

Clone this repository:
```bash
git clone https://github.com/mygulamali/secret_bambino.git
```

Install the required gems:
```bash
bundle install
```

Copy the `.env.example` file to `.env` and populate with your settings.  You can test that your GMail SMTP server settings work correctly by executing the command:
```bash
./secret_bambino.exe test EMAIL_ADDRESS MESSAGE
```

Create a YAML file containing the names and email addresses of participating Bambinos.  See the `bambinos.yaml` file as an example.

Edit the `templates/message.html.erb` and the `templates/message.txt.erb` files to contain your HTML and plain text email messages, respectively, to participating Bambinos.  You can test that the messages render and read correctly by executing the command:
```bash
./secret_bambino.exe test EMAIL_ADDRESS
```

## Usage

Run:
```bash
./secret_bambino.exe assign BAMBINOS_YAML
```
where `BAMBINOS_YAML` is the YAML file created in the setup above.

## License

This project is licensed under the terms of the [MIT License](http://opensource.org/licenses/mit-license.php).  Please see the `LICENSE` file for more details.
