class VisitsController < ApplicationController
  def index
    @visits = Visit.all.order({ :created_at => :desc })

    render({ :template => "visits/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @visit = Visit.where({:id => the_id }).at(0)

    render({ :template => "visits/show.html.erb" })
  end

  def create
    @visit = Visit.new
    @visit.purpose = params.fetch("purpose_from_query")
    @visit.visitors_id = params.fetch("visitors_id_from_query")
    @visit.location_id = params.fetch("location_id_from_query")

    if @visit.valid?
      @visit.save
      redirect_to("/visits", { :notice => "Visit created successfully." })
    else
      redirect_to("/visits", { :notice => "Visit failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @visit = Visit.where({ :id => the_id }).at(0)

    @visit.purpose = params.fetch("purpose_from_query")
    @visit.visitors_id = params.fetch("visitors_id_from_query")
    @visit.location_id = params.fetch("location_id_from_query")

    if @visit.valid?
      @visit.save
      redirect_to("/visits/#{@visit.id}", { :notice => "Visit updated successfully."} )
    else
      redirect_to("/visits/#{@visit.id}", { :alert => "Visit failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @visit = Visit.where({ :id => the_id }).at(0)

    @visit.destroy

    redirect_to("/visits", { :notice => "Visit deleted successfully."} )
  end
end
