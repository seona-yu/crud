class HomeController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
    
  end

  def create

    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:text]
    @post.save

    redirect_to '/'
  end


  def show

    @post =Post.find(params[:post_id])

  end

  def destroy
    #Post.destroy_all
    @post =Post.find(params[:post_id]) #특정ROW를 선택해서 @변수에 넣음 /찾은 것
    @post.destroy                      # 지우기 명령어 (내부적 처리)

    redirect_to '/'
  end


  def edit
   @post=Post.find(params[:post_id])
  end

  def update
    @post=Post.find(params[:post_id])  #이미 있는 것을 찾고 그것을 넣을 것.
    @post.title = params[:title]
    @post.content = params[:text]
    @post.save

    redirect_to '/'

  end
end


=begin

9. 모든 ACTION은 하나의 VIEW파일로 보여진다.

8. 모든 것은 index에서 비롯이 되는 것.
index에서 모든 것을 가지고 있음. 애당초에.


7. 해당 글의 title에 접근을 하는 것..... show의 목적.
: @post = Post.find(3)
params[:post_id]

params={post_id => '3'}

1. Post.new : 새로운 공간을 만들어라.......
2. params[:title] : 이 정보를 
@Post.title : 새로 만든 공간의 타이틀에 넣어라.

params {title=>"hello", content=>"world"}

3. @를 안써도 저장은 가능하지만, view파일에서 사용을 하기 위한 것. 인스턴스 변수를 설정.
4. create action 자체에서 하는 행위는 없지만, index로 넘겨주기 위한 것.
5. @hey = Post.find(4)
@hey.title = "이윤비" -> update 방법.

6. Model : 저장공간(표)



=end