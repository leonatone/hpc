cwlVersion: v1.0

class: Workflow

inputs:

  inp_file: File
  fbl_file: File

  fbd_file: File

  msh_file_name: string

  vtk_file_name: string

  proj_name: string

  out_pattern: string



outputs:

  classout:

    type: File

    outputSource: step_ccx/vtk_file



steps:

  step_cgx:

    run: cgx.cwl
    label: cgx

    in:

      inp_file: inp_file

      fbl_file: fbl_file

      fbd_file: fbd_file

      msh_file_name: msh_file_name

    out: [msh_file]



  step_ccx:

    run: ccx.cwl
    label: ccx

    in:

      msh_file: step_cgx/msh_file

      proj_name: proj_name

      vtk_file_name: vtk_file_name

    out: [vtk_file]
