class HomeController < ApplicationController
	before_action :authenticate_user!,except: [:zalonin]
    def blog
    	respond_to do |format|
    		format.html{
    			@post=Post.new
    			@post_feed=Post.all.order(created_at: :desc)
    		}
    		format.js{   }	
    	end
    end

    def zalonin
    end
    def ecommerce
    end
    def sign_up
      return redirect_to 'users/sign_up'
    end
    def create
      id = params[:product_id]
       cart = Cart.new
       cart.user_id = current_user.id
       cart.product_id = id;
       cart.quantity = params[:quantity];
       
      respond_to do |format|
          if cart.quantity<=cart.product.quantity
            cart.product.quantity = cart.product.quantity - cart.quantity
            cart.product.save
               if cart.quantity>0&&cart.save
                  format.html { redirect_to "/home/productpage?id="+cart.product.id.to_s, notice: 'successfully added in cart' }
                  format.json { render :show, status: :created, location: cart }
                  format.js { }
              else
                  format.html {redirect_to "/home/productpage?id="+cart.product.id.to_s,alert: 'specify quantity'}
                  format.json { render json: cart.errors, status: :unprocessable_entity }
                  format.js{ }
              end
        else
            format.html { redirect_to "/home/productpage?id="+cart.product.id.to_s,alert: "only " + cart.product.quantity.to_s + " is/are there"}
        end
      end
  end
 
   def profilepage

   end
   def profile_picture
      current_user.profilepicture = params[:profilepicture]
      current_user.save
      return redirect_to '/home/profilepage?id='+current_user.id.to_s

   end
  def users
    @users = if params[:username]
    @users = User.where('username LIKE ?', "%#{params[:username]}%")
    else
    @users = User.all
      end
  end
  def follow
  followee_id = params[:followee_id]
  @followee = User.find(followee_id)
  follower_id = current_user.id
  @follower = User.find(follower_id)
  
  f = Followmapping.where(follower_id: follower_id,followee_id: followee_id).first
  if f
    f.destroy
  elsif followee_id.to_i != follower_id.to_i
    f = Followmapping.new
    f.follower_id = follower_id
    f.followee_id = followee_id
    f.save
  end
 respond_to do |format|
    format.html{
       return redirect_to '/home/users'
    }
    format.js{ }
  end
end
end
