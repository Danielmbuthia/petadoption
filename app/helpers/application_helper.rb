module ApplicationHelper
    def avatar_url(user)
        if user.avatar.attached?
            url_for(user.avatar)
        elsif user.image
            user.image
        else
            'undraw_profile_3.svg'
        end
    end
end
