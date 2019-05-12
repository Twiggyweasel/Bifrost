module Admin::TicketsHelper

    def status_styler(status)
        case status
        when "pending_review"
            ("<span class='tag is-white is-pulled-right'>Pending Review</span>").html_safe
        when "in_progress"
            ("<span class='tag is-primary is-pulled-right'>In Progress</span>").html_safe
        when "on_hold"
            ("<span class='tag is-danger is-pulled-right'>On hold</span>").html_safe
        when "resolved"
            ("<sspan class='tag is-success is-pulled-right'>Resolved</span>").html_safe
        else
            ("<span class='tag is-light is-pulled-right'>#{status}</span>").html_safe
        end
    end
end
