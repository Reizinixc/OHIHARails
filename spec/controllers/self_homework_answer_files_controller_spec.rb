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

describe SelfHomeworkAnswerFilesController do

  # This should return the minimal set of attributes required to create a valid
  # SelfHomeworkAnswerFile. As you add validations to SelfHomeworkAnswerFile, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SelfHomeworkAnswerFilesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all self_homework_answer_files as @self_homework_answer_files" do
      self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
      get :index, {}, valid_session
      assigns(:self_homework_answer_files).should eq([self_homework_answer_file])
    end
  end

  describe "GET show" do
    it "assigns the requested self_homework_answer_file as @self_homework_answer_file" do
      self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
      get :show, {:id => self_homework_answer_file.to_param}, valid_session
      assigns(:self_homework_answer_file).should eq(self_homework_answer_file)
    end
  end

  describe "GET new" do
    it "assigns a new self_homework_answer_file as @self_homework_answer_file" do
      get :new, {}, valid_session
      assigns(:self_homework_answer_file).should be_a_new(SelfHomeworkAnswerFile)
    end
  end

  describe "GET edit" do
    it "assigns the requested self_homework_answer_file as @self_homework_answer_file" do
      self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
      get :edit, {:id => self_homework_answer_file.to_param}, valid_session
      assigns(:self_homework_answer_file).should eq(self_homework_answer_file)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SelfHomeworkAnswerFile" do
        expect {
          post :create, {:self_homework_answer_file => valid_attributes}, valid_session
        }.to change(SelfHomeworkAnswerFile, :count).by(1)
      end

      it "assigns a newly created self_homework_answer_file as @self_homework_answer_file" do
        post :create, {:self_homework_answer_file => valid_attributes}, valid_session
        assigns(:self_homework_answer_file).should be_a(SelfHomeworkAnswerFile)
        assigns(:self_homework_answer_file).should be_persisted
      end

      it "redirects to the created self_homework_answer_file" do
        post :create, {:self_homework_answer_file => valid_attributes}, valid_session
        response.should redirect_to(SelfHomeworkAnswerFile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved self_homework_answer_file as @self_homework_answer_file" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelfHomeworkAnswerFile.any_instance.stub(:save).and_return(false)
        post :create, {:self_homework_answer_file => {}}, valid_session
        assigns(:self_homework_answer_file).should be_a_new(SelfHomeworkAnswerFile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SelfHomeworkAnswerFile.any_instance.stub(:save).and_return(false)
        post :create, {:self_homework_answer_file => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested self_homework_answer_file" do
        self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
        # Assuming there are no other self_homework_answer_files in the database, this
        # specifies that the SelfHomeworkAnswerFile created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SelfHomeworkAnswerFile.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => self_homework_answer_file.to_param, :self_homework_answer_file => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested self_homework_answer_file as @self_homework_answer_file" do
        self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
        put :update, {:id => self_homework_answer_file.to_param, :self_homework_answer_file => valid_attributes}, valid_session
        assigns(:self_homework_answer_file).should eq(self_homework_answer_file)
      end

      it "redirects to the self_homework_answer_file" do
        self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
        put :update, {:id => self_homework_answer_file.to_param, :self_homework_answer_file => valid_attributes}, valid_session
        response.should redirect_to(self_homework_answer_file)
      end
    end

    describe "with invalid params" do
      it "assigns the self_homework_answer_file as @self_homework_answer_file" do
        self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelfHomeworkAnswerFile.any_instance.stub(:save).and_return(false)
        put :update, {:id => self_homework_answer_file.to_param, :self_homework_answer_file => {}}, valid_session
        assigns(:self_homework_answer_file).should eq(self_homework_answer_file)
      end

      it "re-renders the 'edit' template" do
        self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SelfHomeworkAnswerFile.any_instance.stub(:save).and_return(false)
        put :update, {:id => self_homework_answer_file.to_param, :self_homework_answer_file => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested self_homework_answer_file" do
      self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
      expect {
        delete :destroy, {:id => self_homework_answer_file.to_param}, valid_session
      }.to change(SelfHomeworkAnswerFile, :count).by(-1)
    end

    it "redirects to the self_homework_answer_files list" do
      self_homework_answer_file = SelfHomeworkAnswerFile.create! valid_attributes
      delete :destroy, {:id => self_homework_answer_file.to_param}, valid_session
      response.should redirect_to(self_homework_answer_files_url)
    end
  end

end
