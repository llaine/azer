require 'test_helper'

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post offers_url, params: { offer: { activities: @offer.activities, blocked: @offer.blocked, budget: @offer.budget, dream_flatmate: @offer.dream_flatmate, end_date: @offer.end_date, is_mock: @offer.is_mock, name: @offer.name, nature: @offer.nature, nb_wanted_people: @offer.nb_wanted_people, never_do: @offer.never_do, partying: @offer.partying, prefered_sex: @offer.prefered_sex, ritual: @offer.ritual, situation: @offer.situation, start_date: @offer.start_date } }
    end

    assert_redirected_to offer_url(Offer.last)
  end

  test "should show offer" do
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    patch offer_url(@offer), params: { offer: { activities: @offer.activities, blocked: @offer.blocked, budget: @offer.budget, dream_flatmate: @offer.dream_flatmate, end_date: @offer.end_date, is_mock: @offer.is_mock, name: @offer.name, nature: @offer.nature, nb_wanted_people: @offer.nb_wanted_people, never_do: @offer.never_do, partying: @offer.partying, prefered_sex: @offer.prefered_sex, ritual: @offer.ritual, situation: @offer.situation, start_date: @offer.start_date } }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to offers_url
  end
end
