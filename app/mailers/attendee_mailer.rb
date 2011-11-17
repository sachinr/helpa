require 'icalendar'
include Icalendar

class AttendeeMailer < ActionMailer::Base
  default from: "helpa@sachinr.com"

  def accepted_email(user, project)
    @user = user
    @url  = project_url(project)
    @project = project

    cal = Calendar.new
    cal.event do
      dtstart     project.start_date
      dtend       project.end_date
      summary     project.name
      description project.description
      organizer   project.organization.name
      klass       "PRIVATE"
    end
    attachments['event.ics'] = cal.to_ical
    mail(:to => user.email,
         :subject => "You have been accepted for #{project.name}")
  end


end
