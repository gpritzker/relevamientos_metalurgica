require "application_system_test_case"

class TareaRealizadasTest < ApplicationSystemTestCase
  setup do
    @tarea_realizada = tarea_realizadas(:one)
  end

  test "visiting the index" do
    visit tarea_realizadas_url
    assert_selector "h1", text: "Tarea realizadas"
  end

  test "should create tarea realizada" do
    visit tarea_realizadas_url
    click_on "Nueva Tarea Realizada"

    fill_in "Cantidad ejecutada", with: @tarea_realizada.cantidad_ejecutada
    fill_in "Descripcion", with: @tarea_realizada.descripcion
    check "En proceso" if @tarea_realizada.en_proceso
    check "Finalizado" if @tarea_realizada.finalizado
    fill_in "Hora fin", with: @tarea_realizada.hora_fin
    fill_in "Hora inicio", with: @tarea_realizada.hora_inicio
    fill_in "Nro modulo", with: @tarea_realizada.nro_modulo
    fill_in "Observaciones", with: @tarea_realizada.observaciones
    fill_in "Parte diario", with: @tarea_realizada.parte_diario_id
    fill_in "Tarea realizada", with: @tarea_realizada.tarea_realizada
    click_on "Crear Tarea realizada"

    assert_text "Tarea realizada creado correctamente"
    click_on "Volver"
  end

  test "should update Tarea realizada" do
    visit tarea_realizada_url(@tarea_realizada)
    click_on "Editar este tarea realizada", match: :first

    fill_in "Cantidad ejecutada", with: @tarea_realizada.cantidad_ejecutada
    fill_in "Descripcion", with: @tarea_realizada.descripcion
    check "En proceso" if @tarea_realizada.en_proceso
    check "Finalizado" if @tarea_realizada.finalizado
    fill_in "Hora fin", with: @tarea_realizada.hora_fin
    fill_in "Hora inicio", with: @tarea_realizada.hora_inicio
    fill_in "Nro modulo", with: @tarea_realizada.nro_modulo
    fill_in "Observaciones", with: @tarea_realizada.observaciones
    fill_in "Parte diario", with: @tarea_realizada.parte_diario_id
    fill_in "Tarea realizada", with: @tarea_realizada.tarea_realizada
    click_on "Actualizar Tarea realizada"

    assert_text "Tarea realizada actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Tarea realizada" do
    visit tarea_realizada_url(@tarea_realizada)
    click_on "Eliminar este tarea realizada", match: :first

    assert_text "Tarea realizada eliminado correctamente"
  end
end
