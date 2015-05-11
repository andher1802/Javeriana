__author__ = 'andresh'

import numpy as np
import matplotlib.pyplot as plt
import string
import os

def phaseDetector(listStride):
    return 0

def main():

    outLine = []
    for root, dirs, files in os.walk("/home/andresh/Documents/software/Javeriana/DatosBiometrics/"):
        for file in files:
            fileName = root+file
            nameDecode = string.split(file, '_')

            if len(nameDecode) > 2:
                BWSLevel = nameDecode[0]
                velLevel = string.split(nameDecode[2], '.')[0]

                with open(fileName, 'r') as inputFile:
                    rawTextLines = inputFile.readlines()
                    gluteoMedial = []
                    rectoFemoral = []
                    vastoLateral = []
                    gastrocnemioLateral = []
                    gastrocnemioMedial = []
                    goniometroSenal = []
                    goniometroRef = []
                    footSwitch = []
                    xAxis = range(len(rawTextLines[:-1]))

                    #Read elements from the csv File
                    for line in rawTextLines[:-1]:
                        measurementLine = line.strip()
                        measurementLine = string.split(measurementLine, '\t')
                        gluteoMedial.append(int(measurementLine[0]))
                        rectoFemoral.append(int(measurementLine[1]))
                        vastoLateral.append(int(measurementLine[2]))
                        gastrocnemioLateral.append(int(measurementLine[3]))
                        gastrocnemioMedial.append(int(measurementLine[4]))
                        goniometroSenal.append(int(measurementLine[5]))
                        goniometroRef.append(int(measurementLine[6]))
                        footSwitch.append(int(measurementLine[-1]))

                    # Take out 0's from the pos 0 to the first 1 and form the last 0 to the last 1
                    # This is for taking into account just complete strides
                    for elementPos in xAxis:
                        if footSwitch[elementPos] == 0:
                            posFlag = elementPos
                            break
                    for elementPos in reversed(xAxis):
                        if footSwitch[elementPos] == 0:
                            negFlag = elementPos
                            break

                    gluteoMedial = list(gluteoMedial[posFlag:negFlag])
                    rectoFemoral = list(rectoFemoral[posFlag:negFlag])
                    vastoLateral = list(vastoLateral[posFlag:negFlag])
                    gastrocnemioLateral = list(gastrocnemioLateral[posFlag:negFlag])
                    gastrocnemioMedial = list(gastrocnemioMedial[posFlag:negFlag])
                    goniometroSenal = list(goniometroSenal[posFlag:negFlag])
                    goniometroRef = list(goniometroRef[posFlag:negFlag])
                    footSwitch = list(footSwitch[posFlag:negFlag])
                    xAxis = range(len(footSwitch[:-1]))

                    # Detecting the start point for each stride 
                    zeroCrossing = []
                    for element in xAxis:
                        if footSwitch[element] == 1 and footSwitch[element+1] == 0:
                            zeroCrossing.append(element)
                    posIndex = 0

                    # Make a list with the data of each stide by element 

                    gluteoMedialTemp = [gluteoMedial[0:zeroCrossing[0]]]
                    rectoFemoralTemp = [rectoFemoral[0:zeroCrossing[0]]]
                    vastoLateralTemp = [vastoLateral[0:zeroCrossing[0]]]
                    gastrocnemioLateralTemp = [gastrocnemioLateral[0:zeroCrossing[0]]]
                    gastrocnemioMedialTemp = [gastrocnemioMedial[0:zeroCrossing[0]]]
                    goniometroSenalTemp = [goniometroSenal[0:zeroCrossing[0]]]
                    goniometroRefTemp = [goniometroRef[0:zeroCrossing[0]]]
                    footSwitchTemp = [footSwitch[0:zeroCrossing[0]]]

                    for element in zeroCrossing[:-1]:
                        posIndex += 1
                        gluteoMedialTemp.append(gluteoMedial[element+1:zeroCrossing[posIndex]])
                        rectoFemoralTemp.append(rectoFemoral[element+1:zeroCrossing[posIndex]])
                        vastoLateralTemp.append(vastoLateral[element+1:zeroCrossing[posIndex]])
                        gastrocnemioLateralTemp.append(gastrocnemioLateral[element+1:zeroCrossing[posIndex]])
                        gastrocnemioMedialTemp.append(gastrocnemioMedial[element+1:zeroCrossing[posIndex]])
                        goniometroSenalTemp.append(goniometroSenal[element+1:zeroCrossing[posIndex]])
                        goniometroRefTemp.append(goniometroRef[element+1:zeroCrossing[posIndex]])
                        footSwitchTemp.append(footSwitch[element+1:zeroCrossing[posIndex]])

                    #Normalization of each stride
                    sizeList = []
                    for element in footSwitchTemp:
                        sizeList.append(len(element))
                    minSize = min(sizeList)

                    # Averaging for all strides 
                    averagedGluteoMedialTemp = [0.0] * minSize
                    for measurement in gluteoMedialTemp:
                        averagedGluteoMedialTemp = np.add(averagedGluteoMedialTemp, measurement[:minSize])
                    averagedGluteoMedialTemp = averagedGluteoMedialTemp/len(gluteoMedialTemp)

                    averagedrectoFemoralTemp = [0.0] * minSize
                    for measurement in rectoFemoralTemp:
                        averagedrectoFemoralTemp = np.add(averagedrectoFemoralTemp, measurement[:minSize])
                    averagedrectoFemoralTemp = averagedrectoFemoralTemp/len(rectoFemoralTemp)

                    averagedvastoLateralTemp = [0.0] * minSize
                    for measurement in vastoLateralTemp:
                        averagedvastoLateralTemp = np.add(averagedvastoLateralTemp, measurement[:minSize])
                    averagedvastoLateralTemp = averagedvastoLateralTemp/len(vastoLateralTemp)

                    averagedgastrocnemioLateralTemp = [0.0] * minSize
                    for measurement in gastrocnemioLateralTemp:
                        averagedgastrocnemioLateralTemp = np.add(averagedgastrocnemioLateralTemp, measurement[:minSize])
                    averagedgastrocnemioLateralTemp = averagedgastrocnemioLateralTemp/len(gastrocnemioLateralTemp)

                    averagedgastrocnemioMedialTemp = [0.0] * minSize
                    for measurement in gastrocnemioMedialTemp:
                        averagedgastrocnemioMedialTemp = np.add(averagedgastrocnemioMedialTemp, measurement[:minSize])
                    averagedgastrocnemioMedialTemp = averagedgastrocnemioMedialTemp/len(gastrocnemioMedialTemp)

                    averagedgoniometroSenalTemp = [0.0] * minSize
                    for measurement in goniometroSenalTemp:
                        averagedgoniometroSenalTemp = np.add(averagedgoniometroSenalTemp, measurement[:minSize])
                    averagedgoniometroSenalTemp = averagedgoniometroSenalTemp/len(goniometroSenalTemp)

                    averagedgoniometroRefTemp = [0.0] * minSize
                    for measurement in goniometroRefTemp:
                        averagedgoniometroRefTemp = np.add(averagedgoniometroRefTemp, measurement[:minSize])
                    averagedgoniometroRefTemp = averagedgoniometroRefTemp/len(goniometroRefTemp)

                    averagedfootSwitchTemp = [0.0] * minSize
                    for measurement in footSwitchTemp:
                        averagedfootSwitchTemp = np.add(averagedfootSwitchTemp, measurement[:minSize])
                    averagedfootSwitchTemp = averagedfootSwitchTemp/len(footSwitchTemp)

                    #Detecting stride phase 
                    xAxis = range(len(averagedfootSwitchTemp))
                    completeRange = xAxis[-1]
                    initialContact = 0
                    loadingResponse = int(completeRange*0.1)
                    midStance = int(completeRange*0.3)
                    terminalStance = int(completeRange*0.5)
                    preSwing = int(completeRange*0.6)
                    initialSwing = int(completeRange*0.7)
                    midSwing = int(completeRange*0.85)
                    terminalSwing = int(completeRange)

                    for elementPos in xAxis:
                        if averagedfootSwitchTemp[elementPos] == 0 or averagedfootSwitchTemp[elementPos] == 1:
                            strideSingleTimeZero = [str(averagedGluteoMedialTemp[elementPos]), str(averagedrectoFemoralTemp[elementPos]), str(averagedvastoLateralTemp[elementPos]),
                                                str(averagedgastrocnemioLateralTemp[elementPos]), str(averagedgastrocnemioMedialTemp[elementPos]), str(averagedgoniometroSenalTemp[elementPos]),
                                                str(averagedgoniometroRefTemp[elementPos]), str(averagedfootSwitchTemp[elementPos])]
                            outLineSingleZero = list(strideSingleTimeZero)
                            outLineSingleZero.extend([str(BWSLevel), str(velLevel)])
                            # print completeRange, initialContact, midStance, terminalStance, elementPos
                            if elementPos >= initialContact and elementPos <= loadingResponse:
                                outLineSingleZero.extend([str('loadingResponse')])
                            elif elementPos >= loadingResponse and elementPos <= midStance:
                                outLineSingleZero.extend([str('midStance')])
                            elif elementPos >= midStance and elementPos <= terminalStance:
                                outLineSingleZero.extend([str('terminalStance')])
                            elif elementPos >= terminalStance and elementPos <= preSwing:
                                outLineSingleZero.extend([str('preSwing')])
                            elif elementPos >= preSwing and elementPos <= initialSwing:
                                outLineSingleZero.extend([str('initialSwing')])
                            elif elementPos >= initialSwing and elementPos <= midSwing:
                                outLineSingleZero.extend([str('midSwing')])
                            elif elementPos >= midSwing and elementPos <= terminalSwing:
                                outLineSingleZero.extend([str('terminalSwing')])
                            outLineSingleZero.extend([file])
                            outLine.append(outLineSingleZero)

    with open('/home/andresh/Documents/software/Javeriana/outputFile.csv', 'w') as outFile:
        for line in outLine:
            print >> outFile, string.join(line, '\t')
        print 'finished'
    return 0

if __name__=='__main__':
    main()
