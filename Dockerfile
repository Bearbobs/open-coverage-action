FROM ruby:2.7-alpine

LABEL "com.github.actions.name"="Open-Coverage-Action"
LABEL "com.github.actions.description"="Sends a comment notifcation regarding code coverage in pul requests"
LABEL "com.github.actions.repository"="https://github.com/Bearbobs/open-coverage-action"
LABEL "com.github.actions.maintainer"="Anuj Kapoor <Bearbobs@github.com>"
LABEL "com.github.actions.icon"="message-square"
LABEL "com.github.actions.color"="black"

RUN gem install octokit

ADD edit.sh /edit.sh
RUN chmod +x /edit.sh
RUN bash -c /edit.sh

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
