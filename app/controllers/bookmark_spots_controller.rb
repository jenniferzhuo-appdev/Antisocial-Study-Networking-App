class BookmarkSpotsController < ApplicationController
  def index
    @bookmark_spots = BookmarkSpot.all.order({ :created_at => :desc })

    render({ :template => "bookmark_spots/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @bookmark_spot = BookmarkSpot.where({:id => the_id }).at(0)

    render({ :template => "bookmark_spots/show.html.erb" })
  end

  def create
    @bookmark_spot = BookmarkSpot.new
    @bookmark_spot.favorite_location_id = params.fetch("favorite_location_id_from_query")
    @bookmark_spot.user_id = params.fetch("user_id_from_query")

    if @bookmark_spot.valid?
      @bookmark_spot.save
      redirect_to("/bookmark_spots", { :notice => "Bookmark spot created successfully." })
    else
      redirect_to("/bookmark_spots", { :notice => "Bookmark spot failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @bookmark_spot = BookmarkSpot.where({ :id => the_id }).at(0)

    @bookmark_spot.favorite_location_id = params.fetch("favorite_location_id_from_query")
    @bookmark_spot.user_id = params.fetch("user_id_from_query")

    if @bookmark_spot.valid?
      @bookmark_spot.save
      redirect_to("/bookmark_spots/#{@bookmark_spot.id}", { :notice => "Bookmark spot updated successfully."} )
    else
      redirect_to("/bookmark_spots/#{@bookmark_spot.id}", { :alert => "Bookmark spot failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @bookmark_spot = BookmarkSpot.where({ :id => the_id }).at(0)

    @bookmark_spot.destroy

    redirect_to("/bookmark_spots", { :notice => "Bookmark spot deleted successfully."} )
  end
end
