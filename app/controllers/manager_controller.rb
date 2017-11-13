class ManagerController < ApplicationController
    before_action :set_user
    # 11. 05 soomti make
    # 관리자 (홈페이지) 가 페이지를 관리하는곳

    # to do 
    # 1. 신규 스터디룸을 등록한다
    # 2. QNA 메세지를 받는다
    # 3. 모든 가입한 회원을 볼 수 있다
    # 4. 등록한 스터디룸을 관리한다

    def index
      @title = "관리자 페이지 입니다"
      @content = {"Space 등록하기" => "new_space_info_path",
                  "Q&A 게시판 가기" => "2",
                  "User 정보" => "3",
                  "Space 정보" => "4"}
    end
    # 1.
    def new

    end
    # 2.
    def qna
    end
    # 3.
    def user
      @UserList = User.all
    end
    # 4.
    def space

    end

    private
    def set_user
      @user = current_user
      puts @user.user_level
      unless(@user.user_level == "9")        
        redirect_to "/"
      end
    end
end
