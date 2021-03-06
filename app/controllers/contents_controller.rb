class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    @post = Post.find(params[:post_id])
    @contents = @post.contents.all
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @post = Post.find(params[:post_id])
  end

  # GET /contents/new
  def new
    @post = Post.find(params[:post_id])
    @content = Content.new
    # @content = @post.contents.new
  end

  # GET /contents/1/edit
  def edit
    @post = Post.find(params[:post_id])
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)
    @post = Post.find(params[:post_id])

    respond_to do |format|
      if @content.save
        format.html { redirect_to post_content_path(@post, @content), notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    @post = Post.find(params[:post_id])
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to post_content_path(@post, @content), notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to post_contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:language, :body, :post_id)
    end
end
