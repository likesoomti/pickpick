require 'test_helper'

class SpifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spif = spifs(:one)
  end

  test "should get index" do
    get spifs_url
    assert_response :success
  end

  test "should get new" do
    get new_spif_url
    assert_response :success
  end

  test "should create spif" do
    assert_difference('Spif.count') do
      post spifs_url, params: { spif: { address: @spif.address, consent: @spif.consent, ct: @spif.ct, name: @spif.name, ot: @spif.ot, park: @spif.park, payment: @spif.payment, photo: @spif.photo, place: @spif.place, pph: @spif.pph, printer: @spif.printer, projector: @spif.projector, smok: @spif.smok, wifi: @spif.wifi } }
    end

    assert_redirected_to spif_url(Spif.last)
  end

  test "should show spif" do
    get spif_url(@spif)
    assert_response :success
  end

  test "should get edit" do
    get edit_spif_url(@spif)
    assert_response :success
  end

  test "should update spif" do
    patch spif_url(@spif), params: { spif: { address: @spif.address, consent: @spif.consent, ct: @spif.ct, name: @spif.name, ot: @spif.ot, park: @spif.park, payment: @spif.payment, photo: @spif.photo, place: @spif.place, pph: @spif.pph, printer: @spif.printer, projector: @spif.projector, smok: @spif.smok, wifi: @spif.wifi } }
    assert_redirected_to spif_url(@spif)
  end

  test "should destroy spif" do
    assert_difference('Spif.count', -1) do
      delete spif_url(@spif)
    end

    assert_redirected_to spifs_url
  end
end
