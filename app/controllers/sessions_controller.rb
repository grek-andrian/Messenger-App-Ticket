class SessionsController < Devise::SessionsController
    include MailboxHelper

    # POST /resource/sign_in
    def create
        self.resource = warden.authenticate!(auth_options)
        if unread_messages_count > 0
            flash[:success] = "Signed in successfully. You have #{view_context.link_to("#{unread_messages_count} unread massage inbox.", mailbox_inbox_path)}"
        else
            flash[:success] = "Signed in successfully. You don't have any unread message."
        end
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
    end
end
