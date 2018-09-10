class ComparisonsController < ApplicationController
  def index
  end

  def compare
    input = params[:compare][:ingredient_list]
    split_input = input.split(', ')
    @name_array = split_input.map { |original| { original: original, downcased: original.strip.gsub(' ', '_').downcase } }
    @match_count = 0

    @name_array.each do |name|
      if bad_list_includes?(name[:downcased])
        name[:match] = true
        @match_count += 1
      else
        name[:match] = false
      end
    end
  end

  def bad_list_includes?(string)
    BAD_LIST.each do |element|
      return true if string.include? element
    end

    return false
  end

  BAD_LIST = %w[
    acetylated_lanolin
    acetylated_lanolin_alcohol
    active_soil_complex
    ahnfeltia_concinna
    alaria_esculenta
    algae_extract
    algin
    argan_oil
    argania_spinosa
    ascophyllium_nodosum
    avocado_oil
    algae

    bismuth_oxychloride
    black_kelp
    bladderwack
    blue_algae
    blue_green_algae
    brown_algae
    butyl_stearate

    carrageenan
    carrageenan_moss
    cetyl_acetate
    cetyl_alcohol
    cetearyl_alcohol_&_ceteareth_20
    ceteareth_20
    cetearyl_alcohol
    chlorella
    chondrus_crispus
    coal_tar
    cocoa_butter
    coconute_alkanes
    coconut_butter
    cocoas_nucifera
    coconut_oil
    colloidal_sulfer
    corallina_officinalis
    cotton_awws
    cotton_seed_oil
    crithmum_maritimum

    d_&_c_red_#_3
    D_&_C_Red_#3
    D_&_C_Red#3
    Red_#_3
    Red_#3
    Red_#3
    D_&_C_Red_#_17
    D_&_C_Red_#17
    D_&_C_Red#17
    Red_#_17
    Red_#17
    Red_#17
    D_&_C_Red_#_21
    D_&_C_Red_#21
    D_&_C_Red#21
    Red_#_21
    Red_#21
    Red_#21
    D_&_C_Red_#_36
    D_&_C_Red_#36
    D_&_C_Red#36
    Red_#_36
    Red_#36
    Red_#36
    D_&_C_Red_#_30
    D_&_C_Red_#30
    D_&_C_Red#30
    Red_#_30
    Red_#30
    Red_#30
    decyl_oleate
    dilsea_carnosa
    dioctyl_succinate
    disodium_monooleamido_peg_2-sulfosuccinate
    disodium_monooleamido
    disodium_monooleamido_peg_2_-_sulfosuccinate
    peg_2-sulfosuccinate
    peg_2_-_sulfosuccinate
    dulse

    ecklonia
    enteromorpha_compressa
    ethoxylated_lanolin
    ethylhexyl_palmitate
    evening_primrose_oil
    primrose_oil

    fucus_vesiculosus

    glyceryl_stearate_se
    glyceryl_stearate
    glyceryl_stearate_s_e
    glyceryl_3_diisostearate
    glyceryl_3_-_diisostearate
    glyceryl_3-diisostearate
    glyceryl_3_-_disostearate
    glyceryl_3-disostearate
    grapeseed_oil

    haslea_ostearia
    himanthalia_elongate
    hydrogenated_vegetable_oil
    hydrolyzed_lola_implexa
    hydrolyzed_rhodophycea
    hypnea_musciformis

    irish_moss
    isocetyl_alcohol
    isocetyl_stearate
    isodecyl_oleate
    isopropyl_isosterate
    isopropyl_isostearate
    isopropyl_linolate
    isopropyl_linoleate
    isopropyl_myristate
    isopropyl_palmitate
    isostearyl_isostearate
    isostearyl_neopentanoate

    kelp

    laminaria_digitata
    laminaria_digitara
    laminaria_longicruris
    laminaria_saccharine
    lanolin
    lanolin_alcohol
    laureth-4
    laureth_-_4
    laureth_-_23
    laureth-23
    lauric_acid
    lauryl_alcohol
    linseed_oil
    lithothamnium_calcareum
    lola_implexa

    marine_algae
    mastocarpus_stellatus
    mineral_oil
    mink_oil
    myreth_3_myristate
    myreth_3
    myreth_myristate
    myristic_acid
    myristyl_lactate
    myristyk_myristate

    norwegian_kelp

    octyl_palmitate
    octyl_stearate
    oleth
    oleth_-_3
    oleth_3
    oleth-3
    oleth_-_5
    oleth_5
    oleth-5
    oleyl_alcohol

    padina_pavonica
    palmaria_palmate
    peanut_oil
    peg_16_lanolin
    peg_16
    peg-16
    peg-200
    peg_lanolin
    peg_200_dilaurate
    peg_dilaurate
    petroleum
    pg_monostearate
    phytessence_wakame
    plankton
    porphyra
    porphydridium_cruentum
    ppg_2_myristyl_propionate
    ppg_2
    ppg_myristyl_propionate
    myristyl_propionate
    ppg_5_ceteth_10_phosphate
    ppg_5_ceteth_phosphate
    ppg_ceteth_10_phosphate
    ppg_ceteth_phosphate
    ceteth_10_phosphate
    ceteth_phosphate
    ppg_10
    ppg_5
    ppg_10_cetyl_ether
    ppg_cetyl_ether
    cetyl_ether
    polyglyceryl_-_3_diisostearate
    polyglyceryl-_3_diisostearate
    polyglyceryl_diisostearate
    polyglyceryl_3_diisostearate
    potassium_chloride
    propylene_glycol_monostearate
    propylene_glycol
    glycol_monostearate

    red_algae
    rockweed
    rosehip_oil

    sargassum
    seaweed
    sea_whip
    sesame_oil
    shark_liver_oil
    shea_butter
    shea
    sodium_laureth_sulfate
    sodium_lauryl_sulfate
    soil_minerals
    solulan_16
    solulan
    sorbitan_oleate
    soybean_oil
    spirulina
    steareth_10
    steareth
    stearic_acid_tea
    stearic_acid
    stearyl_heptanoate
    sulfated_castor_oil
    sulfated_jojoba_oil
    jojoba_oil

    ulva_lactuca
    undaria

    wakame
    wheat_germ_glyceride
    wheat_germ_oil

    xylene



  ].map(&:downcase)
end
