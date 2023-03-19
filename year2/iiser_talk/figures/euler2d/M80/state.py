# state file generated using paraview version 5.10.0-RC1

#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# ----------------------------------------------------------------
# setup views used in the visualization
# ----------------------------------------------------------------

# get the material library
materialLibrary1 = GetMaterialLibrary()

# Create a new 'Render View'
renderView1 = CreateView('RenderView')
renderView1.ViewSize = [1698, 946]
renderView1.InteractionMode = '2D'
renderView1.AxesGrid = 'GridAxes3DActor'
renderView1.OrientationAxesVisibility = 0
renderView1.CenterOfRotation = [1.0, 0.0, 0.0]
renderView1.StereoType = 'Crystal Eyes'
renderView1.CameraPosition = [0.926541376773924, 0.0006523824279671452, 4.319751617610021]
renderView1.CameraFocalPoint = [0.926541376773924, 0.0006523824279671452, 0.0]
renderView1.CameraFocalDisk = 1.0
renderView1.CameraParallelScale = 0.5215711070771516
renderView1.BackEnd = 'OSPRay raycaster'
renderView1.OSPRayMaterialLibrary = materialLibrary1

SetActiveView(None)

# ----------------------------------------------------------------
# setup view layouts
# ----------------------------------------------------------------

# create new layout object 'Layout #1'
layout1 = CreateLayout(name='Layout #1')
layout1.AssignView(0, renderView1)
layout1.SetSize(1698, 946)

# ----------------------------------------------------------------
# restore active view
SetActiveView(renderView1)
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# setup the data processing pipelines
# ----------------------------------------------------------------

# create a new 'XML Unstructured Grid Reader'
solution_035355vtu = XMLUnstructuredGridReader(registrationName='solution_035355.vtu', FileName=['\\\\wsl$\\ubuntu_msi\\home\\arpit\\misc\\temp\\astrophysical_jet_M80_trixi\\solution_035355.vtu'])
solution_035355vtu.PointArrayStatus = ['rho', 'v1', 'v2', 'p']
solution_035355vtu.TimeArray = 'None'

# create a new 'XML Rectilinear Grid Reader'
sol100vtr = XMLRectilinearGridReader(registrationName='sol100.vtr', FileName=['\\\\wsl$\\ubuntu_msi\\home\\arpit\\misc\\temp\\astrophysical_jet_M80\\sol100.vtr'])
sol100vtr.PointArrayStatus = ['sol']

# ----------------------------------------------------------------
# setup the visualization in view 'renderView1'
# ----------------------------------------------------------------

# show data from solution_035355vtu
solution_035355vtuDisplay = Show(solution_035355vtu, renderView1, 'UnstructuredGridRepresentation')

# get color transfer function/color map for 'rho'
rhoLUT = GetColorTransferFunction('rho')
rhoLUT.RGBPoints = [0.09777948918707627, 0.278431372549, 0.278431372549, 0.858823529412, 0.2632987616341901, 0.0, 0.0, 0.360784313725, 0.7041115524798651, 0.0, 1.0, 1.0, 1.9091977825149395, 0.0, 0.501960784314, 0.0, 5.105562237719046, 1.0, 1.0, 0.0, 13.748161560404089, 1.0, 0.380392156863, 0.0, 37.020789776017985, 0.419607843137, 0.0, 0.0, 99.68888346405447, 0.878431372549, 0.301960784314, 0.301960784314]
rhoLUT.UseLogScale = 1
rhoLUT.ColorSpace = 'RGB'
rhoLUT.ScalarRangeInitialized = 1.0

# get opacity transfer function/opacity map for 'rho'
rhoPWF = GetOpacityTransferFunction('rho')
rhoPWF.Points = [0.09777948918707625, 0.0, 0.5, 0.0, 99.68888346405451, 1.0, 0.5, 0.0]
rhoPWF.ScalarRangeInitialized = 1

# trace defaults for the display properties.
solution_035355vtuDisplay.Representation = 'Surface'
solution_035355vtuDisplay.ColorArrayName = ['POINTS', 'rho']
solution_035355vtuDisplay.LookupTable = rhoLUT
solution_035355vtuDisplay.SelectTCoordArray = 'None'
solution_035355vtuDisplay.SelectNormalArray = 'None'
solution_035355vtuDisplay.SelectTangentArray = 'None'
solution_035355vtuDisplay.OSPRayScaleArray = 'p'
solution_035355vtuDisplay.OSPRayScaleFunction = 'PiecewiseFunction'
solution_035355vtuDisplay.SelectOrientationVectors = 'None'
solution_035355vtuDisplay.ScaleFactor = 0.2
solution_035355vtuDisplay.SelectScaleArray = 'None'
solution_035355vtuDisplay.GlyphType = 'Arrow'
solution_035355vtuDisplay.GlyphTableIndexArray = 'None'
solution_035355vtuDisplay.GaussianRadius = 0.01
solution_035355vtuDisplay.SetScaleArray = ['POINTS', 'p']
solution_035355vtuDisplay.ScaleTransferFunction = 'PiecewiseFunction'
solution_035355vtuDisplay.OpacityArray = ['POINTS', 'p']
solution_035355vtuDisplay.OpacityTransferFunction = 'PiecewiseFunction'
solution_035355vtuDisplay.DataAxesGrid = 'GridAxesRepresentation'
solution_035355vtuDisplay.PolarAxes = 'PolarAxesRepresentation'
solution_035355vtuDisplay.ScalarOpacityFunction = rhoPWF
solution_035355vtuDisplay.ScalarOpacityUnitDistance = 0.04811823159054527
solution_035355vtuDisplay.OpacityArrayName = ['POINTS', 'p']

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
solution_035355vtuDisplay.ScaleTransferFunction.Points = [-3.305073291795137, 0.0, 0.5, 0.0, 2015.0790479773655, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
solution_035355vtuDisplay.OpacityTransferFunction.Points = [-3.305073291795137, 0.0, 0.5, 0.0, 2015.0790479773655, 1.0, 0.5, 0.0]

# show data from sol100vtr
sol100vtrDisplay = Show(sol100vtr, renderView1, 'UniformGridRepresentation')

# get color transfer function/color map for 'sol'
solLUT = GetColorTransferFunction('sol')
solLUT.RGBPoints = [0.10731841319897309, 0.278431372549, 0.278431372549, 0.858823529412, 0.2852992217514242, 0.0, 0.0, 0.360784313725, 0.7532818724260776, 0.0, 1.0, 1.0, 2.0162912977190333, 0.0, 0.501960784314, 0.0, 5.323658700427626, 1.0, 1.0, 0.0, 14.152610338043399, 1.0, 0.380392156863, 0.0, 37.6238205060749, 0.419607843137, 0.0, 0.0, 100.0205499665472, 0.878431372549, 0.301960784314, 0.301960784314]
solLUT.UseLogScale = 1
solLUT.ColorSpace = 'RGB'
solLUT.ScalarRangeInitialized = 1.0

# get opacity transfer function/opacity map for 'sol'
solPWF = GetOpacityTransferFunction('sol')
solPWF.Points = [0.10731841319897309, 0.0, 0.5, 0.0, 100.02054996654724, 1.0, 0.5, 0.0]
solPWF.ScalarRangeInitialized = 1

# trace defaults for the display properties.
sol100vtrDisplay.Representation = 'Surface'
sol100vtrDisplay.ColorArrayName = ['POINTS', 'sol']
sol100vtrDisplay.LookupTable = solLUT
sol100vtrDisplay.SelectTCoordArray = 'None'
sol100vtrDisplay.SelectNormalArray = 'None'
sol100vtrDisplay.SelectTangentArray = 'None'
sol100vtrDisplay.OSPRayScaleArray = 'sol'
sol100vtrDisplay.OSPRayScaleFunction = 'PiecewiseFunction'
sol100vtrDisplay.SelectOrientationVectors = 'None'
sol100vtrDisplay.ScaleFactor = 0.1999581160026512
sol100vtrDisplay.SelectScaleArray = 'None'
sol100vtrDisplay.GlyphType = 'Arrow'
sol100vtrDisplay.GlyphTableIndexArray = 'None'
sol100vtrDisplay.GaussianRadius = 0.009997905800132559
sol100vtrDisplay.SetScaleArray = ['POINTS', 'sol']
sol100vtrDisplay.ScaleTransferFunction = 'PiecewiseFunction'
sol100vtrDisplay.OpacityArray = ['POINTS', 'sol']
sol100vtrDisplay.OpacityTransferFunction = 'PiecewiseFunction'
sol100vtrDisplay.DataAxesGrid = 'GridAxesRepresentation'
sol100vtrDisplay.PolarAxes = 'PolarAxesRepresentation'
sol100vtrDisplay.ScalarOpacityUnitDistance = 0.016459417319577792
sol100vtrDisplay.ScalarOpacityFunction = solPWF
sol100vtrDisplay.OpacityArrayName = ['POINTS', 'sol']
sol100vtrDisplay.SliceFunction = 'Plane'

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
sol100vtrDisplay.ScaleTransferFunction.Points = [0.10731841319897309, 0.0, 0.5, 0.0, 100.02054996654724, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
sol100vtrDisplay.OpacityTransferFunction.Points = [0.10731841319897309, 0.0, 0.5, 0.0, 100.02054996654724, 1.0, 0.5, 0.0]

# init the 'Plane' selected for 'SliceFunction'
sol100vtrDisplay.SliceFunction.Origin = [0.9999999999999999, 0.0, 0.0]

# setup the color legend parameters for each legend in this view

# get color legend/bar for rhoLUT in view renderView1
rhoLUTColorBar = GetScalarBar(rhoLUT, renderView1)
rhoLUTColorBar.WindowLocation = 'Any Location'
rhoLUTColorBar.Position = [0.6979328850681548, 0.10739942689310794]
rhoLUTColorBar.Title = ''
rhoLUTColorBar.ComponentTitle = ''
rhoLUTColorBar.TitleFontSize = 35
rhoLUTColorBar.LabelFontSize = 35
rhoLUTColorBar.ScalarBarThickness = 45
rhoLUTColorBar.ScalarBarLength = 0.8000000000000003

# set color bar visibility
rhoLUTColorBar.Visibility = 0

# get color legend/bar for solLUT in view renderView1
solLUTColorBar = GetScalarBar(solLUT, renderView1)
solLUTColorBar.WindowLocation = 'Any Location'
solLUTColorBar.Position = [0.697932885, 0.107399]
solLUTColorBar.Title = ''
solLUTColorBar.ComponentTitle = ''
solLUTColorBar.TitleFontSize = 35
solLUTColorBar.LabelFontSize = 35
solLUTColorBar.ScalarBarThickness = 45
solLUTColorBar.ScalarBarLength = 0.8000000000000003

# set color bar visibility
solLUTColorBar.Visibility = 1

# hide data in view
Hide(solution_035355vtu, renderView1)

# show color legend
sol100vtrDisplay.SetScalarBarVisibility(renderView1, True)

# ----------------------------------------------------------------
# setup color maps and opacity mapes used in the visualization
# note: the Get..() functions create a new object, if needed
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# restore active source
SetActiveSource(sol100vtr)
# ----------------------------------------------------------------


if __name__ == '__main__':
    # generate extracts
    SaveExtracts(ExtractsOutputDirectory='extracts')