class CloseFriendRequestsController < ApplicationController
  def index
    @close_friend_requests = CloseFriendRequest.all.order({ :created_at => :desc })

    render({ :template => "close_friend_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @close_friend_request = CloseFriendRequest.where({:id => the_id }).at(0)

    render({ :template => "close_friend_requests/show.html.erb" })
  end

  def create
    @close_friend_request = CloseFriendRequest.new
    @close_friend_request.sender_id = params.fetch("sender_id_from_query")
    @close_friend_request.recipent_id = params.fetch("recipent_id_from_query")
    @close_friend_request.accepted = params.fetch("accepted_from_query", false)

    if @close_friend_request.valid?
      @close_friend_request.save
      redirect_to("/close_friend_requests", { :notice => "Close friend request created successfully." })
    else
      redirect_to("/close_friend_requests", { :notice => "Close friend request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @close_friend_request = CloseFriendRequest.where({ :id => the_id }).at(0)

    @close_friend_request.sender_id = params.fetch("sender_id_from_query")
    @close_friend_request.recipent_id = params.fetch("recipent_id_from_query")
    @close_friend_request.accepted = params.fetch("accepted_from_query", false)

    if @close_friend_request.valid?
      @close_friend_request.save
      redirect_to("/close_friend_requests/#{@close_friend_request.id}", { :notice => "Close friend request updated successfully."} )
    else
      redirect_to("/close_friend_requests/#{@close_friend_request.id}", { :alert => "Close friend request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @close_friend_request = CloseFriendRequest.where({ :id => the_id }).at(0)

    @close_friend_request.destroy

    redirect_to("/close_friend_requests", { :notice => "Close friend request deleted successfully."} )
  end
end
