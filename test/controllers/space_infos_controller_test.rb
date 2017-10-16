require 'test_helper'

class SpaceInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @space_info = space_infos(:one)
  end

  test "should get index" do
    get space_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_space_info_url
    assert_response :success
  end

  test "should create space_info" do
    assert_difference('SpaceInfo.count') do
      post space_infos_url, params: { space_info: { address: @space_info.address, consent: @space_info.consent, ct: @space_info.ct, name: @space_info.name, ot: @space_info.ot, parking: @space_info.parking, payment: @space_info.payment, photo: @space_info.photo, place: @space_info.place, price_per_hour: @space_info.price_per_hour, printer: @space_info.printer, projector: @space_info.projector, smoking: @space_info.smoking, tel: @space_info.tel, wifi: @space_info.wifi } }
    end

    assert_redirected_to space_info_url(SpaceInfo.last)
  end

  test "should show space_info" do
    get space_info_url(@space_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_space_info_url(@space_info)
    assert_response :success
  end

  test "should update space_info" do
    patch space_info_url(@space_info), params: { space_info: { address: @space_info.address, consent: @space_info.consent, ct: @space_info.ct, name: @space_info.name, ot: @space_info.ot, parking: @space_info.parking, payment: @space_info.payment, photo: @space_info.photo, place: @space_info.place, price_per_hour: @space_info.price_per_hour, printer: @space_info.printer, projector: @space_info.projector, smoking: @space_info.smoking, tel: @space_info.tel, wifi: @space_info.wifi } }
    assert_redirected_to space_info_url(@space_info)
  end

  test "should destroy space_info" do
    assert_difference('SpaceInfo.count', -1) do
      delete space_info_url(@space_info)
    end

    assert_redirected_to space_infos_url
  end
end
