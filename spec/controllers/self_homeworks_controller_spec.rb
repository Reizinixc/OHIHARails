require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SelfHomeworksController do

  # This should return the minimal set of attributes required to create a valid
  # SelfHomework. As you add validations to SelfHomework, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SelfHomeworksController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all self_homeworks as @self_homeworks" do
      self_homework = SelfHomework.create! valid_attributes
      get :index, {}, valid_session
      assigns(:self_homeworks).should eq([self_homework])
    end
  end

  describe "GET show" do
    it "assigns the requested self_homework as @self_homework" do
      self_homework = SelfHomework.create! valid_attributes
      get :show, {:id => self_homework.to_param}, valid_session
      assigns(:self_homework).should eq(self_homework)
    end
  end

  describe "GET new" do
    it "assigns a new self_homework as @self_homework" do
      get :new, {}, valid_session
      assigns(:self_homework).should be_a_new(SelfHomework)
    end
  end

  describe "GET edit" do
    it "assigns the requested self_homework as @self_homework" do
      self_homework = SelfHomework.create! valid_attributes
      get :edit, {:id => self_homework.to_param}, valid_session
      assigns(:self_homework).should eq(self_homework)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SelfHomework" do
        expect {
          post :create, {:self_homework => valid_attributes}, valid_session
        }.to change(SelfHomework, :count).by(1)
      end

      it "assigns a newly created self_homework as @self_homework" do
        post :create, {:self_homework => valid_attributes}, valid_session
        assigns(:self_homework).should be_a(SelfHomework)
        assigns(:self_homework).should be_persisted
      end

      it "redirects to the created self_homework" do
        post :create, {:self_homework => valid_attributes}, valid_session
        response.should redirect_to(SelfHomework.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved self_homework as @self_homework" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelfHomework.any_instance.stub(:save).and_return(false)
        post :create, {:self_homework => {}}, valid_session
        assigns(:self_homework).should be_a_new(SelfHomework)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelfHomework.any_instance.stub(:save).and_return(false)
        post :create, {:self_homework => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested self_homework" do
        self_homework = SelfHomework.create! valid_attributes
        # Assuming there are no other self_homeworks in the database, this
        # specifies that the SelfHomework created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SelfHomework.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => self_homework.to_param, :self_homework => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested self_homework as @self_homework" do
        self_homework = SelfHomework.create! valid_attributes
        put :update, {:id => self_homework.to_param, :self_homework => valid_attributes}, valid_session
        assigns(:self_homework).should eq(self_homework)
      end

      it "redirects to the self_homework" do
        self_homework = SelfHomework.create! valid_attributes
        put :update, {:id => self_homework.to_param, :self_homework => valid_attributes}, valid_session
        response.should redirect_to(self_homework)
      end
    end

    describe "with invalid params" do
      it "assigns the self_homework as @self_homework" do
        self_homework = SelfHomework.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelfHomework.any_instance.stub(:save).and_return(false)
        put :update, {:id => self_homework.to_param, :self_homework => {}}, valid_session
        assigns(:self_homework).should eq(self_homework)
      end

      it "re-renders the 'edit' template" do
        self_homework = SelfHomework.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelfHomework.any_instance.stub(:save).and_return(false)
        put :update, {:id => self_homework.to_param, :self_homework => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested self_homework" do
      self_homework = SelfHomework.create! valid_attributes
      expect {
        delete :destroy, {:id => self_homework.to_param}, valid_session
      }.to change(SelfHomework, :count).by(-1)
    end

    it "redirects to the self_homeworks list" do
      self_homework = SelfHomework.create! valid_attributes
      delete :destroy, {:id => self_homework.to_param}, valid_session
      response.should redirect_to(self_homeworks_url)
    end
  end

end
