class <%=plural_name.capitalize%>Controller < ApplicationController

  def index
    @<%=plural_name%> = <%=file_name.capitalize%>.all
  end

  def show
    @<%=plural_name%> = <%=file_name.capitalize%>.find(params[:id])
  end

  def new
    @<%=plural_name%> = <%=file_name.capitalize%>.new
  end

  def edit
    @<%=plural_name%> = <%=file_name.capitalize%>.find(params[:id])
  end

  def create
    @<%=plural_name%> = <%=file_name.capitalize%>.new(params[:proposal])
  end

  def update
    @<%=plural_name%> = <%=file_name.capitalize%>.find(params[:id])
  end

  def destroy
    @<%=plural_name%> = <%=file_name.capitalize%>.find(params[:id])
    @<%=plural_name%>.destroy
  end

end
