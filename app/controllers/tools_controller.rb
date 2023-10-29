class ToolsController < ApplicationController
   def index
    @tools = Tool.all
    @tool = Tool.new
   end

  def create

     @tool = Tool.new(tool_params)

    if @tool.save
      flash[:notice] = "Tool was successfully created"
      redirect_to tool_path(@tool.id)
    else
      @tools = Tool.all
      render :index
    end

  end

  def index
    @tools = Tool.all
    @tool = Tool.new
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def edit
     @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      flash[:notice] = "Took was successfully created"
      redirect_to tool_path(@tool.id)
    else
      render :edit
    end



  end

  def destroy
    tool =Tool.find(params[:id])  # データ（レコード）を1件取得
    tool.destroy  # データ（レコード）を削除
    redirect_to '/tools'  # 投稿一覧画面へリダイレクト


  end
   private
  # ストロングパラメータ
  def tool_params
    params.require(:tool).permit(:title, :body)
  end
end


