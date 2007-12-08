/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 9810, Fri Dec  7 23:53:57 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000065FB (26107)
 *     Revision         0x01
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "INTL"
 *     Creator Revision 0x20050624 (537200164)
 */
DefinitionBlock ("9810.aml", "DSDT", 1, "ACRSYS", "ACRPRDCT", 0x06040000)
{
    External (PDC1)
    External (PDC0)
    External (CFGD)

    OperationRegion (PRT0, SystemIO, 0x80, 0x01)
    Field (PRT0, ByteAcc, Lock, Preserve)
    {
        PO80,   8
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
                Offset (0x08), 
        TRP0,   8
    }

    OperationRegion (PMIO, SystemIO, 0x1000, 0x80)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x10), 
            ,   1, 
        THDY,   3, 
        THEN,   1, 
                Offset (0x42), 
            ,   1, 
        GPEC,   1
    }

    OperationRegion (GPIO, SystemIO, 0x1180, 0x3C)
    Field (GPIO, ByteAcc, NoLock, Preserve)
    {
        GU00,   8, 
        GU01,   8, 
        GU02,   8, 
        GU03,   8, 
        GIO0,   8, 
        GIO1,   8, 
        GIO2,   8, 
        GIO3,   8, 
                Offset (0x0C), 
        GL00,   8, 
            ,   4, 
        GP12,   1, 
        GP13,   1, 
        GP14,   1, 
        GP15,   1, 
            ,   3, 
        BTPW,   1, 
                Offset (0x0F), 
        GL03,   8, 
                Offset (0x18), 
        GB00,   8, 
        GB01,   8, 
        GB02,   8, 
        GB03,   8, 
                Offset (0x2C), 
        GIV0,   8, 
        GIV1,   8, 
        GIV2,   8, 
        GIV3,   8, 
        GU04,   8, 
        GU05,   8, 
        GU06,   8, 
        GU07,   8, 
        GIO4,   8, 
        GIO5,   8, 
        GIO6,   8, 
        GIO7,   8, 
            ,   2, 
        BTRS,   1, 
            ,   4, 
        GP39,   1, 
        GL05,   8, 
        GL06,   8, 
        GL07,   8
    }

    OperationRegion (GNVS, SystemMemory, 0x7FE99DBC, 0x0100)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
                Offset (0x14), 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        FANS,   8, 
        BNUM,   8, 
        B0SC,   8, 
        B1SC,   8, 
        B2SC,   8, 
        B0SS,   8, 
        B1SS,   8, 
        B2SS,   8, 
                Offset (0x28), 
        APIC,   8, 
        MPEN,   8, 
        PPCS,   8, 
        PPCM,   8, 
                Offset (0x32), 
        NATP,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
        CMCP,   8, 
        CIRP,   8, 
                Offset (0x3C), 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
                Offset (0x67), 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
                Offset (0x6E), 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
                Offset (0x74), 
        MEFE,   8, 
                Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
                Offset (0x1000), 
                Offset (0x3000), 
                Offset (0x3404), 
        HPAS,   2, 
            ,   5, 
        HPAE,   1, 
                Offset (0x3418), 
            ,   1, 
        PATD,   1, 
        SATD,   1, 
        SMBD,   1, 
        HDAD,   1, 
        A97D,   1, 
                Offset (0x341A), 
        RP1D,   1, 
        RP2D,   1, 
        RP3D,   1, 
        RP4D,   1, 
        RP5D,   1, 
        RP6D,   1
    }

    OperationRegion (ECMB, SystemIO, 0x0400, 0x02)
    Field (ECMB, ByteAcc, NoLock, Preserve)
    {
        MIDX,   8, 
        MDAT,   8
    }

    IndexField (MIDX, MDAT, ByteAcc, NoLock, Preserve)
    {
                Offset (0x8E), 
                Offset (0x8F), 
                Offset (0xA1), 
        COMD,   8, 
        IND0,   8, 
        IND1,   8, 
        DAT0,   8, 
        DAT1,   8, 
                Offset (0xA7), 
        WEXT,   1, 
        BEXT,   1, 
            ,   1, 
        WPRS,   1, 
        TPRS,   1, 
        BPRS,   1, 
        CRTS,   1, 
                Offset (0xA8), 
            ,   1, 
        WINF,   1, 
                Offset (0xA9), 
        CLMT,   2, 
                Offset (0xAA), 
        BRIG,   4, 
        WSTS,   1, 
        BSTS,   1, 
        ALED,   1, 
        ELED,   1, 
                Offset (0xAC), 
        CTMP,   8
    }

    Name (RTMP, 0x01)
    Name (TMPI, 0x00)
    Method (RDEC, 1, NotSerialized)
    {
        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
        Store (IND0, TMPI)
        Store (Arg0, IND0)
        Store (0x90, COMD)
        Sleep (0x0A)
        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        Store (DAT0, Local0)
        Store (TMPI, IND0)
        Sleep (0x01)
        Release (\_SB.PCI0.LPCB.EC0.MUT1)
        Return (Local0)
    }

    Method (WREC, 2, NotSerialized)
    {
        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
        Store (IND0, TMPI)
        Store (Arg0, IND0)
        Store (Arg1, DAT0)
        Store (0x91, COMD)
        Sleep (0x0A)
        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        Store (TMPI, IND0)
        Release (\_SB.PCI0.LPCB.EC0.MUT1)
    }

    Method (ECW1, 2, NotSerialized)
    {
        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
        Store (Arg0, DAT0)
        Store (Arg1, COMD)
        Sleep (0x0A)
        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        If (COMD)
        {
            Sleep (0x0A)
        }

        Release (\_SB.PCI0.LPCB.EC0.MUT1)
    }

    Mutex (MUTX, 0x00)
    Name (_S0, Package (0x03)
    {
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x03)
    {
        0x05, 
        0x05, 
        0x00
    })
    Name (_S4, Package (0x03)
    {
        0x06, 
        0x06, 
        0x00
    })
    Name (_S5, Package (0x03)
    {
        0x07, 
        0x07, 
        0x00
    })
    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06) {}
        Processor (CPU1, 0x01, 0x00001010, 0x06)
        {
            Method (_INI, 0, NotSerialized)
            {
                If (DTSE)
                {
                    Store (0x46, SMIF)
                    Store (0x00, TRP0)
                }
            }
        }
    }

    Name (DSEN, 0x01)
    Name (ECON, 0x00)
    Name (GPIC, 0x00)
    Name (CTYP, 0x00)
    Name (L01C, 0x00)
    Name (VFN0, 0x00)
    Name (VFN1, 0x00)
    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, PO80)
        If (LEqual (DBGS, 0x00)) {}
        If (LEqual (Arg0, 0x05))
        {
            ECW1 (0x00, 0x18)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x13, PRM0)
            Store (0x8A, SMIF)
            Store (0x00, TRP0)
            Store (0x85, SMIF)
            Store (0x00, TRP0)
        }

        If (LNotEqual (Arg0, 0x05))
        {
            WREC (0xB6, Or (RDEC (0xB6), 0x01))
        }

        Store (0x84, SMIF)
        Store (0x00, TRP0)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x14, PRM0)
            Store (0x8A, SMIF)
            Store (0x00, TRP0)
            Store (0x86, SMIF)
            Store (0x00, TRP0)
            WREC (0xB8, Or (RDEC (0xB8), 0x02))
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (0x00, PO80)
        If (LEqual (Arg0, 0x03))
        {
            If (LAnd (DTSE, MPEN))
            {
                Store (0x46, SMIF)
                Store (0x00, TRP0)
            }
        }

        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LEqual (OSYS, 0x07D1)))
                {
                    Store (0x3D, SMIF)
                    Store (0x00, TRP0)
                }
            }
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x8B, SMIF)
            Store (0x00, TRP0)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x87, SMIF)
            Store (0x00, TRP0)
            If (And (CFGD, 0x01))
            {
                If (LGreater (PPCS, 0x00))
                {
                    Subtract (PPCS, 0x01, PPCS)
                    PNOT ()
                    Add (PPCS, 0x01, PPCS)
                    PNOT ()
                }
                Else
                {
                    Add (PPCS, 0x01, PPCS)
                    PNOT ()
                    Subtract (PPCS, 0x01, PPCS)
                    PNOT ()
                }
            }
        }

        Notify (\_SB.PCI0, 0x00)
        Store (0x01, \_SB.LIDF)
        WREC (0xB6, And (RDEC (0xB6), 0xFE))
        Return (Package (0x02)
        {
            0x00, 
            0x00
        })
    }

    Scope (_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Add (L01C, 0x01, L01C)
            Sleep (0x64)
            If (LAnd (LEqual (RP1D, 0x00), \_SB.PCI0.RP01.HPCS))
            {
                If (\_SB.PCI0.RP01.PDC1)
                {
                    Store (0x01, \_SB.PCI0.RP01.PDC1)
                    Store (0x01, \_SB.PCI0.RP01.HPCS)
                    Notify (\_SB.PCI0.RP01, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP01.HPCS)
                }
            }

            If (LAnd (LEqual (RP2D, 0x00), \_SB.PCI0.RP02.HPCS))
            {
                If (\_SB.PCI0.RP02.PDC2)
                {
                    Store (0x01, \_SB.PCI0.RP02.PDC2)
                    Store (0x01, \_SB.PCI0.RP02.HPCS)
                    Notify (\_SB.PCI0.RP02, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP02.HPCS)
                }
            }

            If (LAnd (LEqual (RP3D, 0x00), \_SB.PCI0.RP03.HPCS))
            {
                If (\_SB.PCI0.RP03.PDC3)
                {
                    Store (0x01, \_SB.PCI0.RP03.PDC3)
                    Store (0x01, \_SB.PCI0.RP03.HPCS)
                    Notify (\_SB.PCI0.RP03, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP03.HPCS)
                }
            }

            If (LAnd (LEqual (RP4D, 0x00), \_SB.PCI0.RP04.HPCS))
            {
                If (\_SB.PCI0.RP04.PDC4)
                {
                    Store (0x01, \_SB.PCI0.RP04.PDC4)
                    Store (0x01, \_SB.PCI0.RP04.HPCS)
                    Notify (\_SB.PCI0.RP04, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP04.HPCS)
                }
            }
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            If (HDAD)
            {
                Notify (\_SB.PCI0.MODM, 0x02)
            }
            Else
            {
                Notify (\_SB.PCI0.HDEF, 0x02)
            }
        }

        Method (_L09, 0, NotSerialized)
        {
            If (\_SB.PCI0.RP01.PSP1)
            {
                Store (0x01, \_SB.PCI0.RP01.PSP1)
                Store (0x01, \_SB.PCI0.RP01.PMCS)
                Notify (\_SB.PCI0.RP01, 0x02)
            }

            If (\_SB.PCI0.RP02.PSP2)
            {
                Store (0x01, \_SB.PCI0.RP02.PSP2)
                Store (0x01, \_SB.PCI0.RP02.PMCS)
                Notify (\_SB.PCI0.RP02, 0x02)
            }

            If (\_SB.PCI0.RP03.PSP3)
            {
                Store (0x01, \_SB.PCI0.RP03.PSP3)
                Store (0x01, \_SB.PCI0.RP03.PMCS)
                Notify (\_SB.PCI0.RP03, 0x02)
            }

            If (\_SB.PCI0.RP04.PSP4)
            {
                Store (0x01, \_SB.PCI0.RP04.PSP4)
                Store (0x01, \_SB.PCI0.RP04.PMCS)
                Notify (\_SB.PCI0.RP04, 0x02)
            }
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PCIB, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB3, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB7, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB4, 0x02)
        }

        Method (_L19, 0, NotSerialized)
        {
            Notify (\_SB.LID, 0x80)
        }
    }

    Method (HKDS, 1, Serialized)
    {
        If (LEqual (0x00, DSEN))
        {
            Store (Arg0, SMIF)
            Store (0x00, TRP0)
            If (LEqual (SMIF, 0x00))
            {
                If (LNotEqual (CADL, PADL))
                {
                    Store (CADL, PADL)
                    If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                    {
                        Notify (\_SB.PCI0, 0x00)
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.GFX0, 0x00)
                    }

                    Sleep (0x02EE)
                }

                Notify (\_SB.PCI0.GFX0, 0x80)
            }
        }

        If (LEqual (0x01, DSEN))
        {
            Store (Increment (Arg0), SMIF)
            Store (0x00, TRP0)
            If (LEqual (SMIF, 0x00))
            {
                Notify (\_SB.PCI0.GFX0, 0x81)
            }
        }
    }

    Method (LSDS, 1, Serialized)
    {
        If (Arg0)
        {
            HKDS (0x0C)
        }
        Else
        {
            HKDS (0x0E)
        }

        If (LNotEqual (DSEN, 0x01))
        {
            Sleep (0x32)
            While (LEqual (DSEN, 0x02))
            {
                Sleep (0x32)
            }
        }
    }

    Method (PNOT, 0, Serialized)
    {
        If (MPEN)
        {
            If (And (PDC0, 0x08))
            {
                Notify (\_PR.CPU0, 0x80)
                If (And (PDC0, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU0, 0x81)
                }
            }

            If (And (PDC1, 0x08))
            {
                Notify (\_PR.CPU1, 0x80)
                If (And (PDC1, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU1, 0x81)
                }
            }
        }
        Else
        {
            Notify (\_PR.CPU0, 0x80)
            Sleep (0x64)
            Notify (\_PR.CPU0, 0x81)
        }
    }

    Name (DFEC, 0x00)
    Scope (_TZ)
    {
        PowerResource (FN00, 0x00, 0x0000)
        {
            Method (_STA, 0, Serialized)
            {
                If (LEqual (FANS, 0x00))
                {
                    Return (0x00)
                }
                Else
                {
                    Return (0x01)
                }
            }

            Method (_ON, 0, Serialized)
            {
            }

            Method (_OFF, 0, Serialized)
            {
            }
        }

        Device (FAN0)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, 0x00)
            Name (_PR0, Package (0x01)
            {
                FN00
            })
        }

        ThermalZone (TZ00)
        {
            Method (_AC0, 0, Serialized)
            {
                Return (Add (0x0AAC, Multiply (ACTT, 0x0A)))
            }

            Name (_AL0, Package (0x01)
            {
                FAN0
            })
            Method (_CRT, 0, Serialized)
            {
                If (DTSE)
                {
                    Return (Add (0x0AAC, Multiply (CRTT, 0x0A)))
                }

                Return (0x0ED0)
            }

            Method (_SCP, 1, Serialized)
            {
                Store (Arg0, CTYP)
            }

            Method (_TMP, 0, Serialized)
            {
                If (DTSE)
                {
                    If (LEqual (RTMP, 0x01)) {}
                    Store (0x01, RTMP)
                    If (LGreaterEqual (DTS1, DTS2))
                    {
                        Return (Add (0x0AAC, Multiply (DTS1, 0x0A)))
                    }

                    Return (Add (0x0AAC, Multiply (DTS2, 0x0A)))
                }

                Return (0x0BB8)
            }

            Method (_PSL, 0, Serialized)
            {
                If (MPEN)
                {
                    Return (Package (0x02)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1
                    })
                }

                Return (Package (0x01)
                {
                    \_PR.CPU0
                })
            }

            Method (_PSV, 0, Serialized)
            {
                Return (Add (0x0AAC, Multiply (PSVT, 0x0A)))
            }

            Method (_TSP, 0, Serialized)
            {
                Return (0x96)
            }
        }

        ThermalZone (TZ01)
        {
            Method (_CRT, 0, Serialized)
            {
                Return (0x0ED0)
            }

            Method (_TMP, 0, Serialized)
            {
                Store (CTMP, Local0)
                If (And (Local0, 0x80))
                {
                    Subtract (Local0, 0x0100, Local0)
                }

                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }
        }
    }

    Method (GETP, 1, Serialized)
    {
        If (LEqual (And (Arg0, 0x09), 0x00))
        {
            Return (0xFFFFFFFF)
        }

        If (LEqual (And (Arg0, 0x09), 0x08))
        {
            Return (0x0384)
        }

        ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
        ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
        Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
            ))
    }

    Method (GDMA, 5, Serialized)
    {
        If (Arg0)
        {
            If (LAnd (Arg1, Arg4))
            {
                Return (0x14)
            }

            If (LAnd (Arg2, Arg4))
            {
                Return (Multiply (Subtract (0x04, Arg3), 0x0F))
            }

            Return (Multiply (Subtract (0x04, Arg3), 0x1E))
        }

        Return (0xFFFFFFFF)
    }

    Method (GETT, 1, Serialized)
    {
        Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
            ), 0x03), And (Arg0, 0x03)))))
    }

    Method (GETF, 3, Serialized)
    {
        Name (TMPF, 0x00)
        If (Arg0)
        {
            Or (TMPF, 0x01, TMPF)
        }

        If (And (Arg2, 0x02))
        {
            Or (TMPF, 0x02, TMPF)
        }

        If (Arg1)
        {
            Or (TMPF, 0x04, TMPF)
        }

        If (And (Arg2, 0x20))
        {
            Or (TMPF, 0x08, TMPF)
        }

        If (And (Arg2, 0x4000))
        {
            Or (TMPF, 0x10, TMPF)
        }

        Return (TMPF)
    }

    Method (SETP, 3, Serialized)
    {
        If (LGreater (Arg0, 0xF0))
        {
            Return (0x08)
        }
        Else
        {
            If (And (Arg1, 0x02))
            {
                If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                {
                    Return (0x2301)
                }

                If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                {
                    Return (0x2101)
                }
            }

            Return (0x1001)
        }
    }

    Method (SDMA, 1, Serialized)
    {
        If (LLessEqual (Arg0, 0x14))
        {
            Return (0x01)
        }

        If (LLessEqual (Arg0, 0x1E))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x2D))
        {
            Return (0x01)
        }

        If (LLessEqual (Arg0, 0x3C))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x5A))
        {
            Return (0x01)
        }

        Return (0x00)
    }

    Method (SETT, 3, Serialized)
    {
        If (And (Arg1, 0x02))
        {
            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
            {
                Return (0x0B)
            }

            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
            {
                Return (0x09)
            }
        }

        Return (0x04)
    }

    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store (0x07D0, OSYS)
            If (CondRefOf (_OSI, Local0))
            {
                If (_OSI ("Windows 2001"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    Store (0x07D2, OSYS)
                }

                If (_OSI ("Windows 2006"))
                {
                    Store (0x07D6, OSYS)
                }
            }

            If (MPEN)
            {
                Store (0x3D, SMIF)
                Store (0x00, TRP0)
            }
        }

        Name (LIDF, 0x01)
        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                Return (LIDF)
            }

            Name (_PRW, Package (0x02)
            {
                0x19, 
                0x04
            })
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, 0x01)
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (PBIF, Package (0x0D)
            {
                0x01, 
                0x10CC, 
                0x10CC, 
                0x01, 
                0x3A98, 
                0x00, 
                0x00, 
                0x00, 
                0x00, 
                "Main", 
                "0000", 
                "Li-ion", 
                ""
            })
            Name (PBST, Package (0x04)
            {
                0x01, 
                0x0A90, 
                0x1000, 
                0x2A30
            })
            Method (_STA, 0, NotSerialized)
            {
                If (^^PCI0.LPCB.EC0.ECOK)
                {
                    If (LAnd (RDEC (0x94), 0x01))
                    {
                        Return (0x1F)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
                Else
                {
                    Return (0x1F)
                }
            }

            Name (SERB, "0000")
            Method (_BIF, 0, NotSerialized)
            {
                If (^^PCI0.LPCB.EC0.ECOK)
                {
                    Store (RDEC (0xAA), Local0)
                    Store (RDEC (0xAB), Local5)
                    ShiftLeft (Local5, 0x08, Local5)
                    Add (Local0, Local5, Local0)
                    Store (RDEC (0xAC), Local1)
                    Store (RDEC (0xAD), Local5)
                    ShiftLeft (Local5, 0x08, Local5)
                    Add (Local1, Local5, Local1)
                    Store (Local1, Index (PBIF, 0x01))
                    Store (Local0, Index (PBIF, 0x02))
                    Store (0x00, Index (PBIF, 0x08))
                    Store (RDEC (0xDF), Local0)
                    If (LEqual (Local0, 0x01))
                    {
                        Store ("BATBL50L8H", Index (PBIF, 0x09))
                    }
                    Else
                    {
                        Store ("BATBL50L8H", Index (PBIF, 0x09))
                    }

                    Store (RDEC (0xB9), Local0)
                    Store (RDEC (0xBA), Local5)
                    ShiftLeft (Local5, 0x08, Local5)
                    Add (Local0, Local5, Local0)
                    Store (ITOS (Local0), Local1)
                    Store (Local1, Index (PBIF, 0x0A))
                }

                Return (PBIF)
            }

            Method (_BST, 0, NotSerialized)
            {
                If (WINF)
                {
                    Store (0x01, Index (PBST, Zero))
                    Store (0x78, Index (PBST, 0x01))
                    Store (0x0BB8, Index (PBST, 0x02))
                    Store (0x3A98, Index (PBST, 0x03))
                    Return (PBST)
                }
                Else
                {
                    If (^^PCI0.LPCB.EC0.ECOK)
                    {
                        Store (RDEC (0x94), Local1)
                        Store (And (Local1, 0x10), Local1)
                        ShiftRight (Local1, 0x04, Local1)
                        Store (RDEC (0x95), Local0)
                        Store (And (Local0, 0x01), Local0)
                        ShiftLeft (Local1, 0x01, Local2)
                        Or (Local0, Local2, Local3)
                        Store (RDEC (0xC6), Local2)
                        Multiply (Local2, 0x0100, Local1)
                        Store (RDEC (0xC5), Local0)
                        Add (Local1, Local0, Local1)
                        Store (Local1, Index (PBST, 0x01))
                        Store (And (RDEC (0xA4), 0x7F), Local0)
                        If (LLess (Local0, 0x0F))
                        {
                            Or (Local3, 0x04, Local3)
                        }

                        Store (Local3, Index (PBST, 0x00))
                        Store (DerefOf (Index (PBIF, 0x02)), Local1)
                        Multiply (Local1, Local0, Local2)
                        Divide (Local2, 0x64, Local3, Local2)
                        Add (Local2, 0x0A, Local2)
                        Store (Local2, Index (PBST, 0x02))
                        Store (DerefOf (Index (PBIF, 0x04)), Local3)
                        Store (Local3, Index (PBST, 0x03))
                    }
                    Else
                    {
                        Store (0x01, Index (PBST, Zero))
                        Store (0x78, Index (PBST, 0x01))
                        Store (0x0BB8, Index (PBST, 0x02))
                        Store (0x3A98, Index (PBST, 0x03))
                    }

                    Return (PBST)
                }
            }
        }

        Method (ITOS, 1, NotSerialized)
        {
            Store ("", Local0)
            Store (0x04, Local1)
            While (Local1)
            {
                Decrement (Local1)
                And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
                Store (DerefOf (Index (CHAR, Local4)), Local2)
                Concatenate (Local0, Local2, Local5)
                Store (Local5, Local0)
            }

            Return (Local0)
        }

        Name (CHAR, Package (0x10)
        {
            "0", 
            "1", 
            "2", 
            "3", 
            "4", 
            "5", 
            "6", 
            "7", 
            "8", 
            "9", 
            "A", 
            "B", 
            "C", 
            "D", 
            "E", 
            "F"
        })
        Device (ADP0)
        {
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (_HID, "ACPI0003")
            Method (_PSR, 0, NotSerialized)
            {
                If (WINF)
                {
                    Return (0x01)
                }
                Else
                {
                    If (^^PCI0.LPCB.EC0.ECOK)
                    {
                        Store (RDEC (0x92), Local0)
                        Store (And (Local0, 0x08), Local0)
                        ShiftRight (Local0, 0x03, Local0)
                        If (Local0)
                        {
                            Store (0x01, PWRS)
                            Return (0x01)
                        }
                        Else
                        {
                            Store (0x00, PWRS)
                            Return (0x00)
                        }
                    }
                    Else
                    {
                        Return (0x01)
                    }
                }
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
        Field (SMI0, AnyAcc, NoLock, Preserve)
        {
            SMIC,   8
        }

        OperationRegion (SMI1, SystemMemory, 0x7FE99EBD, 0x00000090)
        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
            BCMD,   8, 
            DID,    32, 
            INFO,   1024
        }

        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
                    AccessAs (ByteAcc, 0x00), 
                    Offset (0x05), 
            INF,    8
        }

        Mutex (PSMX, 0x00)
        OperationRegion (SMI2, SystemMemory, 0x7FE99EBD, 0x00000090)
        Field (SMI2, AnyAcc, NoLock, Preserve)
        {
            WCMD,   8, 
            WDID,   32, 
            TPID,   8, 
            DI00,   320
        }

        Field (SMI2, AnyAcc, NoLock, Preserve)
        {
                    Offset (0x06), 
            D000,   32, 
            D001,   32, 
            D002,   32, 
            D003,   32, 
            D004,   32
        }

        Method (PHWM, 2, NotSerialized)
        {
            Acquire (PSMX, 0xFFFF)
            Store (0xE0, WCMD)
            Store (0x57, TPID)
            Store (Arg0, WDID)
            Store (Arg1, DI00)
            Store (Zero, SMIC)
            Store (DI00, Local0)
            Release (PSMX)
            Return (Local0)
        }

        Device (WMID)
        {
            Name (_HID, "PNP0C14")
            Name (_UID, 0x00)
            Name (ERRD, 0x00010000)
            Name (BUFF, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateByteField (BUFF, 0x00, BF00)
            CreateByteField (BUFF, 0x01, BF01)
            CreateByteField (BUFF, 0x02, BF02)
            CreateByteField (BUFF, 0x03, BF03)
            Name (BUF1, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Name (AADS, Buffer (0x04)
            {
                0x00
            })
            CreateField (AADS, 0x00, 0x04, AS00)
            CreateField (AADS, 0x04, 0x01, AS01)
            CreateField (AADS, 0x05, 0x01, AS02)
            CreateField (AADS, 0x10, 0x10, AS03)
            Name (BAEF, 0x00)
            Name (BADF, 0x00)
            Name (BADG, Package (0x03)
            {
                0x01, 
                0x01, 
                0x00
            })
            Name (BADS, Package (0x04)
            {
                0x00, 
                0x00, 
                0x00, 
                0x00
            })
            Name (WLDS, 0x00)
            Name (WLED, 0x00)
            Name (BTDS, 0x00)
            Name (BTED, 0x00)
            Name (BLDS, 0x00)
            Name (BLED, 0x00)
            Name (NTDC, 0x00)
            Name (WLSD, 0x0100)
            Name (WLSE, 0x0101)
            Name (BLTD, 0x0200)
            Name (BLTE, 0x0201)
            Name (LBL0, 0x0300)
            Name (LBL1, 0x0301)
            Name (LBL2, 0x0302)
            Name (LBL3, 0x0303)
            Name (LBL4, 0x0304)
            Name (LBL5, 0x0305)
            Name (LBL6, 0x0306)
            Name (LBL7, 0x0307)
            Name (LBL8, 0x0308)
            Name (LBL9, 0x0309)
            Name (LBLA, 0x030A)
            Name (LBLB, 0x030B)
            Name (LBLC, 0x030C)
            Name (LBLD, 0x030D)
            Name (LBLE, 0x030E)
            Name (LBLF, 0x030F)
            Name (VAPO, 0x0600)
            Name (VAPI, 0x0601)
            Name (CADI, 0x0401)
            Name (CADO, 0x0400)
            Name (GSEE, 0x0501)
            Name (GSED, 0x0502)
            Name (BNSL, Package (0x10)
            {
                0x0300, 
                0x0301, 
                0x0302, 
                0x0303, 
                0x0304, 
                0x0305, 
                0x0306, 
                0x0307, 
                0x0308, 
                0x0309, 
                0x030A, 
                0x030B, 
                0x030C, 
                0x030D, 
                0x030E, 
                0x030F
            })
            Name (BBSB, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BBSB, 0x00, 0x10, BBD0)
            CreateField (BBSB, 0x10, 0x10, BBD1)
            Name (TLS0, 0x00)
            Name (TLS1, 0x01)
            Name (TLS2, 0x02)
            Name (TLS3, 0x03)
            Name (TLS4, 0x04)
            Name (TLS5, 0x05)
            Name (TLS6, 0x06)
            Name (TLS7, 0x07)
            Name (TLSL, Package (0x07)
            {
                0x07, 
                0x06, 
                0x05, 
                0x04, 
                0x03, 
                0x02, 
                0x01
            })
            Name (BCDS, Package (0x0D)
            {
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000
            })
            Name (BDDS, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BDDS, 0x00, 0x10, BDD0)
            CreateField (BDDS, 0x10, 0x10, BDD1)
            Name (DSY0, Buffer (0x28)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY1, Buffer (0x18)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY2, Buffer (0x10)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY3, Buffer (0x18)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY4, Buffer (0x10)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY5, Buffer (0x28)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            CreateField (DSY0, 0x00, 0x40, DY00)
            CreateField (DSY0, 0x40, 0x40, DY01)
            CreateField (DSY0, 0x80, 0x40, DY02)
            CreateField (DSY0, 0xC0, 0x40, DY03)
            CreateField (DSY0, 0x0100, 0x40, DY04)
            CreateField (DSY1, 0x00, 0x40, DY10)
            CreateField (DSY1, 0x40, 0x40, DY11)
            CreateField (DSY1, 0x80, 0x40, DY12)
            CreateField (DSY2, 0x00, 0x40, DY20)
            CreateField (DSY2, 0x40, 0x10, DY21)
            CreateField (DSY2, 0x50, 0x10, DY22)
            CreateField (DSY0, 0x00, 0xC0, DSX4)
            Name (BEDS, Package (0x10)
            {
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000
            })
            Name (WIT0, 0x00)
            Name (DSY6, Buffer (0x28)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            CreateField (DSY6, 0x00, 0x20, DY60)
            CreateField (DSY6, 0x20, 0x20, DY61)
            CreateField (DSY6, 0x40, 0x20, DY62)
            CreateField (DSY6, 0x60, 0x20, DY63)
            CreateField (DSY6, 0x80, 0x20, DY64)
            Name (WPRW, Buffer (0x14)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00
            })
            CreateField (WPRW, 0x00, 0x08, WWD0)
            CreateField (WPRW, 0x08, 0x08, WWD1)
            CreateField (WPRW, 0x10, 0x08, WWD2)
            CreateField (WPRW, 0x18, 0x08, WWD3)
            CreateField (WPRW, 0x20, 0x08, WWD4)
            CreateField (WPRW, 0x28, 0x20, WWD5)
            Name (WPCI, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (WPCI, 0x00, 0x08, WPIR)
            CreateField (WPCI, 0x08, 0x03, WPIF)
            CreateField (WPCI, 0x0B, 0x05, WPID)
            CreateField (WPCI, 0x10, 0x08, WPIB)
            Name (BFDS, Package (0x04)
            {
                0x02, 
                0x02, 
                0x02, 
                0x02
            })
            Name (GSTS, 0x00)
            Name (BFEF, 0x00)
            Name (BGEF, 0x00)
            Name (BGDS, Package (0x01)
            {
                0x01
            })
            Method (AAF1, 0, NotSerialized)
            {
                If (^^PCI0.LPCB.EC0.ECOK)
                {
                    If (WEXT)
                    {
                        Store (0x07, AS00)
                    }
                    Else
                    {
                        Store (0x00, AS00)
                    }

                    Store (BEXT, AS01)
                    Store (0x01, AS02)
                    Store (0x00, AS03)
                }
                Else
                {
                    Store (0x00, AS00)
                    Store (0x00, AS01)
                    Store (0x00, AS02)
                    Store (0x00, AS03)
                }
            }

            Method (Z000, 1, NotSerialized)
            {
                If (^^PCI0.LPCB.EC0.ECOK)
                {
                    If (LEqual (Arg0, 0x01))
                    {
                        Store (WSTS, Local0)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02))
                        {
                            Store (BSTS, Local0)
                        }
                        Else
                        {
                            Store (BRIG, Local0)
                        }
                    }
                }
                Else
                {
                    Store (0x00, Local0)
                }

                Store (Local0, Index (BADG, Subtract (Arg0, 0x01)))
            }

            Method (Z001, 2, NotSerialized)
            {
                If (^^PCI0.LPCB.EC0.ECOK)
                {
                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, BUFF)
                        If (BF00)
                        {
                            ECW1 (0x05, 0x16)
                        }
                        Else
                        {
                            ECW1 (0x06, 0x16)
                        }
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x06))
                        {
                            Store (Arg1, BUFF)
                            ECW1 (BF00, 0x4D)
                        }
                        Else
                        {
                            Store (Arg1, BUFF)
                            If (BF00)
                            {
                                ECW1 (0x07, 0x16)
                            }
                            Else
                            {
                                ECW1 (0x08, 0x16)
                            }
                        }
                    }
                }
                Else
                {
                }
            }

            Method (Z002, 1, NotSerialized)
            {
                If (LEqual (Arg0, 0x80))
                {
                    If (WPRS)
                    {
                        If (WSTS)
                        {
                            Store (0x00, WPRS)
                            Return (WLSE)
                        }
                        Else
                        {
                            Store (0x00, WPRS)
                            Return (WLSD)
                        }
                    }
                    Else
                    {
                        If (TPRS)
                        {
                            If (BSTS)
                            {
                                Store (0x00, TPRS)
                                Return (BLTE)
                            }
                            Else
                            {
                                Store (0x00, TPRS)
                                Return (BLTD)
                            }
                        }
                        Else
                        {
                            Store (0x00, BPRS)
                            Store (BRIG, Local0)
                            Return (DerefOf (Index (BNSL, Local0)))
                        }
                    }
                }
                Else
                {
                    If (LEqual (Arg0, 0x82))
                    {
                        If (CRTS)
                        {
                            Return (VAPI)
                        }
                        Else
                        {
                            Return (VAPO)
                        }
                    }
                    Else
                    {
                        Return (0x01)
                    }
                }
            }

            Method (Z003, 1, NotSerialized)
            {
                If (Arg0)
                {
                    Store (DerefOf (Index (TLSL, Subtract (Arg0, 0x01))), THDY)
                    Store (0x01, THEN)
                }
                Else
                {
                    Store (Arg0, THEN)
                }
            }

            Method (Z004, 2, NotSerialized)
            {
            }

            Method (Z005, 1, NotSerialized)
            {
            }

            Method (Z006, 1, NotSerialized)
            {
            }

            Method (Z007, 1, NotSerialized)
            {
            }

            Method (Z008, 2, NotSerialized)
            {
                Store (Arg0, ^^PCI0.LPCB.C4C3)
            }

            Method (Z009, 0, NotSerialized)
            {
            }

            Method (Z00A, 0, NotSerialized)
            {
            }

            Method (Z00B, 1, NotSerialized)
            {
            }

            Method (Z00C, 1, NotSerialized)
            {
            }

            Method (Z00D, 0, NotSerialized)
            {
            }

            Method (Z00E, 2, NotSerialized)
            {
            }

            Method (Z00F, 0, NotSerialized)
            {
                Store (0x00, GSTS)
                Return (GSTS)
            }

            Method (Z00G, 1, NotSerialized)
            {
            }

            Method (Z00H, 1, NotSerialized)
            {
            }

            Method (Z00I, 1, NotSerialized)
            {
            }

            Method (Z00J, 1, NotSerialized)
            {
            }

            Method (Z00K, 1, NotSerialized)
            {
            }

            Name (_WDG, Buffer (0xDC)
            {
                /* 0000 */    0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                /* 0008 */    0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                /* 0010 */    0x41, 0x41, 0x01, 0x01, 0x58, 0xF2, 0xF4, 0x6A, 
                /* 0018 */    0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A, 
                /* 0020 */    0xC2, 0xD7, 0xC0, 0xD3, 0x42, 0x41, 0x01, 0x02, 
                /* 0028 */    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                /* 0030 */    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                /* 0038 */    0x80, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7, 
                /* 0040 */    0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60, 
                /* 0048 */    0x0B, 0x4A, 0x3D, 0x39, 0x42, 0x42, 0x01, 0x02, 
                /* 0050 */    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                /* 0058 */    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                /* 0060 */    0x42, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF, 
                /* 0068 */    0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0, 
                /* 0070 */    0xCE, 0x01, 0xC9, 0x97, 0x42, 0x44, 0x01, 0x02, 
                /* 0078 */    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                /* 0080 */    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                /* 0088 */    0x42, 0x45, 0x01, 0x02, 0xB7, 0xA0, 0xC9, 0xA7, 
                /* 0090 */    0x9D, 0x4C, 0x72, 0x4C, 0x83, 0xBB, 0x53, 0xA3, 
                /* 0098 */    0x45, 0x91, 0x71, 0xDF, 0x42, 0x46, 0x01, 0x02, 
                /* 00A0 */    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                /* 00A8 */    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                /* 00B0 */    0x42, 0x47, 0x01, 0x02, 0xA7, 0xB1, 0x85, 0xDB, 
                /* 00B8 */    0x9A, 0x06, 0xBB, 0x4A, 0xA2, 0xB5, 0xD1, 0x86, 
                /* 00C0 */    0xA2, 0x1B, 0x80, 0xF1, 0x81, 0x00, 0x01, 0x08, 
                /* 00C8 */    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                /* 00D0 */    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                /* 00D8 */    0x82, 0x00, 0x01, 0x08
            })
            Method (WQAA, 1, NotSerialized)
            {
                Store (0x10, PO80)
                AAF1 ()
                Store (AADS, BUFF)
                Return (BUFF)
            }

            Method (WMBA, 3, NotSerialized)
            {
                Store (0x11, PO80)
                If (LLess (Arg1, 0x04))
                {
                    Store (Arg1, Local0)
                    Z000 (Local0)
                    Store (DerefOf (Index (BADG, Subtract (Arg1, 0x01))), BUFF)
                    Return (BUFF)
                }
                Else
                {
                    If (LEqual (Arg1, 0x07))
                    {
                        Store (Arg2, BUFF)
                        Store (BF00, BAEF)
                    }
                    Else
                    {
                        Z001 (Arg1, Arg2)
                    }

                    Store (DerefOf (Index (BADS, Subtract (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }
            }

            Method (_WED, 1, NotSerialized)
            {
                Store (0x12, PO80)
                Z002 (Arg0)
            }

            Method (WMBB, 3, NotSerialized)
            {
                If (LEqual (Arg1, 0x01))
                {
                    If (THEN)
                    {
                        Store (DerefOf (Index (TLSL, Subtract (THDY, 0x01))), BBD0)
                        Store (0x00, BBD1)
                        Store (BBSB, BUFF)
                    }
                    Else
                    {
                        Store (0x00, BBD0)
                        Store (0x00, BBD1)
                        Store (0x00, BUFF)
                    }
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, BUFF)
                    Store (BF00, Local0)
                    Z003 (Local0)
                    Store (0x00, BUFF)
                }

                Return (BUFF)
            }

            Method (WMBC, 3, NotSerialized)
            {
                Store (0x14, PO80)
                Z004 (Arg1, Arg2)
                If (LLessEqual (Arg1, 0x05))
                {
                    Store (0x00010000, BUFF)
                }
                Else
                {
                    Store (0x00010000, BUFF)
                }

                Return (BUFF)
            }

            Method (WMBD, 3, NotSerialized)
            {
                Store (0x15, PO80)
                If (LEqual (Arg1, 0x01))
                {
                    Store (Arg2, BUFF)
                    Store (BUFF, Local0)
                    Store (Arg2, WIT0)
                    Z005 (WIT0)
                    Return (DSY0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, Local0)
                    Z006 (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (Arg2, Local0)
                    Z007 (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x04))
                {
                    Store (Arg2, BUFF)
                    Store (BF00, Local0)
                    Z008 (Local0, 0x00)
                    Store (0x00, BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Store (^^PCI0.LPCB.C4C3, BF00)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Z009 ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Z00A ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x08))
                {
                    Store (Arg2, WPRW)
                    Store (WWD1, WPIR)
                    Store (WWD2, WPIF)
                    Store (WWD3, WPID)
                    Store (WWD4, WPIB)
                    Concatenate (WPCI, WWD0, Local0)
                    Z00B (Local0)
                    Return (DSY2)
                }

                If (LEqual (Arg1, 0x09))
                {
                    Store (Arg2, DSY6)
                    Store (DY60, Local0)
                    Store (Arg2, DSY0)
                    Store (DY01, WPRW)
                    Store (WWD1, WPIR)
                    Store (WWD2, WPIF)
                    Store (WWD3, WPID)
                    Store (WWD4, WPIB)
                    Store (WPCI, Local1)
                    Concatenate (DY60, WPCI, Local0)
                    Concatenate (Local0, WWD0, Local1)
                    Z00C (Local1)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    Z00D ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x02))), BUFF)
                    Return (BUFF)
                }

                Return (0x01)
            }

            Method (WMBE, 3, NotSerialized)
            {
                Store (0x16, PO80)
                Z00E (Arg1, Arg2)
                Store (BUFF, Debug)
                Store (BEDS, Debug)
                Store (DerefOf (Index (BEDS, Subtract (Arg1, 0x01))), BUFF)
                Store (BUFF, Debug)
                Return (BUFF)
            }

            Method (WMBF, 3, NotSerialized)
            {
                Store (0x17, PO80)
                If (LGreater (Arg1, 0x04))
                {
                    Store (0x02, BF00)
                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                    Return (BUFF)
                }

                If (0x00)
                {
                    If (LEqual (Arg1, 0x01)) {}
                    Else
                    {
                        If (LEqual (Arg1, 0x02)) {}
                        Else
                        {
                            If (LEqual (Arg1, 0x03)) {}
                            Else
                            {
                            }
                        }
                    }

                    Store (DerefOf (Index (BFDS, Subtract (Arg1, 0x01))), BUFF)
                    Store (BUFF, Debug)
                }
                Else
                {
                    Store (0x03, BF00)
                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                }

                Return (BUFF)
            }

            Method (WMBG, 3, NotSerialized)
            {
                Store (0x18, PO80)
                Store (Arg2, BUFF)
                Store (0x00, BUFF)
                Return (BUFF)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_ADR, 0x00)
            Name (_BBN, 0x00)
            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                        Offset (0x50), 
                    ,   4, 
                PM0H,   2, 
                        Offset (0x51), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                        Offset (0x52), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                        Offset (0x53), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                        Offset (0x54), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                        Offset (0x55), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                        Offset (0x56), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                        Offset (0x57), 
                    ,   7, 
                HENA,   1, 
                        Offset (0x5C), 
                    ,   3, 
                TOUD,   5
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, M1LN)
                ShiftLeft (TOUD, 0x1B, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x0F)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            0x00, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            0x00, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }
                    })
                }
                Else
                {
                    Return (Package (0x0F)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            ^LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            ^LPCB.LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            ^LPCB.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            ^LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            ^LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            ^LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            ^LPCB.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            ^LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            ^LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            ^LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            ^LPCB.LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            ^LPCB.LNKE, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            ^LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            ^LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            ^LPCB.LNKA, 
                            0x00
                        }
                    })
                }
            }

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x01)
                Name (_CRS, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED14000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED18000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED19000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED1C000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x0004B000,         // Address Length
                        )
                })
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x03), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    If (LEqual (NDID, 0x01))
                    {
                        Name (TMP1, Package (0x01)
                        {
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP1, 0x00))
                        Return (TMP1)
                    }

                    If (LEqual (NDID, 0x02))
                    {
                        Name (TMP2, Package (0x02)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP2, 0x00))
                        Store (Or (0x00010000, DID2), Index (TMP2, 0x01))
                        Return (TMP2)
                    }

                    If (LEqual (NDID, 0x03))
                    {
                        Name (TMP3, Package (0x03)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP3, 0x00))
                        Store (Or (0x00010000, DID2), Index (TMP3, 0x01))
                        Store (Or (0x00010000, DID3), Index (TMP3, 0x02))
                        Return (TMP3)
                    }

                    If (LEqual (NDID, 0x04))
                    {
                        Name (TMP4, Package (0x04)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP4, 0x00))
                        Store (Or (0x00010000, DID2), Index (TMP4, 0x01))
                        Store (Or (0x00010000, DID3), Index (TMP4, 0x02))
                        Store (Or (0x00010000, DID4), Index (TMP4, 0x03))
                        Return (TMP4)
                    }

                    Name (TMP5, Package (0x05)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    })
                    Store (Or (0x00010000, DID1), Index (TMP5, 0x00))
                    Store (Or (0x00010000, DID2), Index (TMP5, 0x01))
                    Store (Or (0x00010000, DID3), Index (TMP5, 0x02))
                    Store (Or (0x00010000, DID4), Index (TMP5, 0x03))
                    Store (Or (0x00010000, DID5), Index (TMP5, 0x04))
                    Return (TMP5)
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID1))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x01))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x01))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD02)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID2))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x02))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x02))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD03)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID3))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x04))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x04))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID4))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x08))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x08))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD05)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID5))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x10))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x10))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x04
                })
            }

            Device (RP01)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (P1CS, PCI_Config, 0x40, 0x0100)
                Field (P1CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP1,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS1)
                {
                    Name (_ADR, 0x00)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (P2CS, PCI_Config, 0x40, 0x0100)
                Field (P2CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP2,   1, 
                        ,   2, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP2,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS2)
                {
                    Name (_ADR, 0x00)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x00)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKA, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP03)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP3,   1, 
                        ,   2, 
                    PDC3,   1, 
                        ,   2, 
                    PDS3,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP3,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS3)
                {
                    Name (_ADR, 0x00)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKB, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (P4CS, PCI_Config, 0x40, 0x0100)
                Field (P4CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP4,   1, 
                        ,   2, 
                    PDC4,   1, 
                        ,   2, 
                    PDS4,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP4,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS4)
                {
                    Name (_ADR, 0x00)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x00)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKC, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0000)
                Device (HUB1)
                {
                    Name (_ADR, 0x00)
                    Device (PRT1)
                    {
                        Name (_ADR, 0x01)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }
                }

                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x04
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (0x00, U1EN)
                    }
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0001)
                Device (HUB2)
                {
                    Name (_ADR, 0x00)
                    Device (PRT1)
                    {
                        Name (_ADR, 0x01)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }
                }

                OperationRegion (U2CS, PCI_Config, 0xC4, 0x04)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                    U2EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x04
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U2EN)
                    }
                    Else
                    {
                        Store (0x00, U2EN)
                    }
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0002)
                Device (HUB3)
                {
                    Name (_ADR, 0x00)
                    Device (PRT1)
                    {
                        Name (_ADR, 0x01)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }
                }

                OperationRegion (U2CS, PCI_Config, 0xC4, 0x04)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                    U3EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x04
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U3EN)
                    }
                    Else
                    {
                        Store (0x00, U3EN)
                    }
                }
            }

            Device (USB4)
            {
                Name (_ADR, 0x001D0003)
                Device (HUB4)
                {
                    Name (_ADR, 0x00)
                    Device (PRT1)
                    {
                        Name (_ADR, 0x01)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }
                }

                OperationRegion (U4CS, PCI_Config, 0xC4, 0x04)
                Field (U4CS, DWordAcc, NoLock, Preserve)
                {
                    U4EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x04
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U4EN)
                    }
                    Else
                    {
                        Store (0x00, U4EN)
                    }
                }
            }

            Device (USB7)
            {
                Name (_ADR, 0x001D0007)
                Device (HUB7)
                {
                    Name (_ADR, 0x00)
                    Device (PRT1)
                    {
                        Name (_ADR, 0x01)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)
                    }

                    Device (PRT6)
                    {
                        Name (_ADR, 0x06)
                    }

                    Device (PRT7)
                    {
                        Name (_ADR, 0x07)
                    }

                    Device (PRT8)
                    {
                        Name (_ADR, 0x08)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x04
                })
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Device (SLT0)
                {
                    Name (_ADR, 0x00)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Device (SLT1)
                {
                    Name (_ADR, 0x00010000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Device (SLT2)
                {
                    Name (_ADR, 0x00020000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Device (SLT3)
                {
                    Name (_ADR, 0x00030000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Device (SLT6)
                {
                    Name (_ADR, 0x00050000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Device (LANC)
                {
                    Name (_ADR, 0x00080000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x06)
                        {
                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x01, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x06)
                        {
                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                ^^LPCB.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x01, 
                                ^^LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x02, 
                                ^^LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                ^^LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                ^^LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                ^^LPCB.LNKC, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (AUD0)
            {
                Name (_ADR, 0x001E0002)
            }

            Device (MODM)
            {
                Name (_ADR, 0x001E0003)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x04
                })
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)
                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x20), 
                    PARC,   8, 
                    PBRC,   8, 
                    PCRC,   8, 
                    PDRC,   8, 
                            Offset (0x28), 
                    PERC,   8, 
                    PFRC,   8, 
                    PGRC,   8, 
                    PHRC,   8, 
                            Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                            Offset (0x4C), 
                    GD3L,   8, 
                    GD3H,   8, 
                    GD3M,   8, 
                            Offset (0x60), 
                        ,   7, 
                    C4C3,   1
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PARC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0E)
                                {}
                        })
                        CreateWordField (RTLA, \_SB.PCI0.LPCB.LNKA._CRS._Y0E._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PARC, 0x0F), IRQ0)
                        Return (RTLA)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PARC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PARC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PBRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0F)
                                {}
                        })
                        CreateWordField (RTLB, \_SB.PCI0.LPCB.LNKB._CRS._Y0F._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PBRC, 0x0F), IRQ0)
                        Return (RTLB)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PBRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PBRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PCRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y10)
                                {}
                        })
                        CreateWordField (RTLC, \_SB.PCI0.LPCB.LNKC._CRS._Y10._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PCRC, 0x0F), IRQ0)
                        Return (RTLC)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PCRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PCRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PDRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y11)
                                {}
                        })
                        CreateWordField (RTLD, \_SB.PCI0.LPCB.LNKD._CRS._Y11._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PDRC, 0x0F), IRQ0)
                        Return (RTLD)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PDRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PDRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PERC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLE, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y12)
                                {}
                        })
                        CreateWordField (RTLE, \_SB.PCI0.LPCB.LNKE._CRS._Y12._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PERC, 0x0F), IRQ0)
                        Return (RTLE)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PERC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PERC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PFRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLF, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y13)
                                {}
                        })
                        CreateWordField (RTLF, \_SB.PCI0.LPCB.LNKF._CRS._Y13._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PFRC, 0x0F), IRQ0)
                        Return (RTLF)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PFRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PFRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PGRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLG, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y14)
                                {}
                        })
                        CreateWordField (RTLG, \_SB.PCI0.LPCB.LNKG._CRS._Y14._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PGRC, 0x0F), IRQ0)
                        Return (RTLG)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PGRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PGRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PHRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLH, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y15)
                                {}
                        })
                        CreateWordField (RTLH, \_SB.PCI0.LPCB.LNKH._CRS._Y15._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PHRC, 0x0F), IRQ0)
                        Return (RTLH)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PHRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PHRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x16)
                    Name (ECOK, 0x00)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECOK)
                            Notify (ADP0, 0x00)
                            Notify (BAT0, 0x80)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x90), 
                        LSCI,   8, 
                        LHKY,   8, 
                        LIDS,   1, 
                        DOCK,   1, 
                        FNST,   1, 
                        ACST,   1, 
                        BL1,    1, 
                        BL2,    1, 
                            ,   1, 
                        DKIF,   1, 
                        SMIE,   1, 
                        WLST,   1, 
                        BTRT,   1, 
                        WLIF,   1, 
                        KSST,   1, 
                        BTST,   1, 
                        BION,   1, 
                        BTON,   1, 
                        B1EX,   1, 
                            ,   3, 
                        B1CG,   1, 
                                Offset (0x95), 
                        B1DC,   1, 
                            ,   3, 
                        B1CF,   1, 
                                Offset (0x96), 
                        L1B1,   1, 
                        L1B2,   1, 
                                Offset (0x97), 
                                Offset (0x99), 
                        BL1P,   7, 
                                Offset (0x9A), 
                        BL2P,   7, 
                                Offset (0x9B), 
                        BDED,   8, 
                        CCTV,   8, 
                        CCLT,   8, 
                        CCHT,   8, 
                        CCST,   8, 
                        CFAS,   8, 
                                Offset (0xA2), 
                        WKSV,   8, 
                        BNDT,   8, 
                        B1PT,   8, 
                                Offset (0xA8), 
                        B1RL,   8, 
                        B1RH,   8, 
                        B1FL,   8, 
                        B1FH,   8, 
                        B1DL,   8, 
                        B1DH,   8, 
                                Offset (0xB4), 
                        OTCD,   8, 
                                Offset (0xB6), 
                        WKLD,   1, 
                        WKKY,   1, 
                        WKLN,   1, 
                                Offset (0xB7), 
                        EBPS,   1, 
                        DKIN,   1, 
                        UDKN,   1, 
                                Offset (0xB8), 
                        CKCH,   1, 
                        SWI4,   1, 
                        SDPF,   1, 
                                Offset (0xB9), 
                        B1SL,   8, 
                        B1SH,   8, 
                                Offset (0xBD), 
                        B1PL,   8, 
                        B1PH,   8, 
                                Offset (0xC1), 
                        THON,   8, 
                        THOF,   8, 
                        VFON,   8, 
                        VFOF,   8, 
                        BPRL,   8, 
                        BPRH,   8
                    }

                    Mutex (MUT1, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, DFEC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x01, DFEC)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Method (_Q11, 0, NotSerialized)
                    {
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x8C, SMIF)
                        Store (0x00, TRP0)
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Notify (BAT0, 0x80)
                        Sleep (0x64)
                        Notify (BAT0, 0x81)
                        Sleep (0x64)
                        Notify (ADP0, 0x00)
                    }

                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (0x14, PRM0)
                        Store (0x89, SMIF)
                        Store (0x00, TRP0)
                        Notify (LID, 0x80)
                        Store (And (RDEC (0x92), 0x01), Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x00, LIDF)
                        }
                        Else
                        {
                            Store (0x01, LIDF)
                        }

                        Notify (LID, 0x80)
                    }

                    Method (_Q19, 0, NotSerialized)
                    {
                        Notify (ADP0, 0x00)
                        Notify (BAT0, 0x80)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Store (0x25, PRM0)
                        Store (0x89, SMIF)
                        Store (0x00, TRP0)
                    }

                    Method (_Q26, 0, NotSerialized)
                    {
                        Store (0x26, PRM0)
                        Store (0x89, SMIF)
                        Store (0x00, TRP0)
                    }

                    Method (_Q29, 0, NotSerialized)
                    {
                    }

                    Method (_Q30, 0, NotSerialized)
                    {
                        Store (0x30, PRM0)
                        Store (0x89, SMIF)
                        Store (0x00, TRP0)
                    }

                    Method (_Q31, 0, NotSerialized)
                    {
                        Store (0x31, PRM0)
                        Store (0x89, SMIF)
                        Store (0x00, TRP0)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x32, PRM0)
                        Store (0x89, SMIF)
                        Store (0x00, TRP0)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, PRM0)
                        Store (0x89, SMIF)
                        Store (0x00, TRP0)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, PRM0)
                        Store (0x89, SMIF)
                        Store (0x00, TRP0)
                    }

                    Method (_Q40, 0, NotSerialized)
                    {
                    }

                    Method (_Q50, 0, NotSerialized)
                    {
                        If (^^^^WMID.BAEF)
                        {
                            Notify (WMID, 0x80)
                        }
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y16)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
                        {
                            If (HPAE)
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            If (HPAE)
                            {
                                Return (0x0B)
                            }
                        }

                        Return (0x00)
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPCB.HPET._Y16._BAS, HPT0)
                            If (LEqual (HPAS, 0x01))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (HPAS, 0x02))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (HPAS, 0x03))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x02)
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0680,             // Range Minimum
                            0x0680,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        IO (Decode16,
                            0x1640,             // Range Minimum
                            0x1640,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFE10,             // Range Minimum
                            0xFE10,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0680,             // Range Minimum
                            0x0680,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x06B0,             // Range Minimum
                            0x06B0,             // Range Maximum
                            0x01,               // Alignment
                            0x50,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        IO (Decode16,
                            0x1640,             // Range Minimum
                            0x1640,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFE10,             // Range Minimum
                            0xFE10,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (CIRP)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (SIO1)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Name (_UID, 0x01)
                    Mutex (MX00, 0x00)
                    OperationRegion (VSIO, SystemIO, 0x2E, 0x02)
                    Field (VSIO, ByteAcc, NoLock, Preserve)
                    {
                        I359,   8, 
                        D359,   8
                    }

                    IndexField (I359, D359, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x07), 
                        LDNM,   8, 
                                Offset (0x22), 
                        PWCT,   8, 
                        PWMG,   8, 
                                Offset (0x25), 
                        DEMD,   8
                    }

                    IndexField (I359, D359, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x30), 
                        ACTI,   8, 
                                Offset (0x60), 
                        IOBH,   8, 
                        IOBL,   8, 
                        I2BH,   8, 
                        I2BL,   8, 
                                Offset (0x70), 
                        IRQX,   8, 
                                Offset (0x74), 
                        DMAX,   8, 
                                Offset (0xE0), 
                        HAR,    8, 
                                Offset (0xF0), 
                        MODX,   8, 
                        OPTX,   8
                    }

                    Method (ENCG, 0, NotSerialized)
                    {
                        Acquire (MX00, 0xFFFF)
                        Store (0x55, I359)
                        Store (0x10, LDNM)
                        Or (HAR, 0x02, HAR)
                        Or (HAR, 0x01, HAR)
                    }

                    Method (EXCG, 0, NotSerialized)
                    {
                        Store (0x10, LDNM)
                        Store (0x00, HAR)
                        Store (0xAA, I359)
                        Release (MX00)
                    }

                    Method (SDEV, 1, NotSerialized)
                    {
                        Store (0x07, I359)
                        Store (Arg0, D359)
                    }

                    Method (RDRG, 1, NotSerialized)
                    {
                        Store (Arg0, I359)
                        Store (D359, Local0)
                        Return (Local0)
                    }

                    Method (WRRG, 2, NotSerialized)
                    {
                        Store (Arg0, I359)
                        Store (Arg1, D359)
                    }

                    Method (READ, 3, NotSerialized)
                    {
                        Acquire (MX00, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (RDRG (Arg1), Local1)
                        }

                        And (Local1, Arg2, Local1)
                        Release (MX00)
                        Return (Local1)
                    }

                    Method (WRIT, 3, NotSerialized)
                    {
                        Acquire (MX00, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            WRRG (Arg1, Arg2)
                        }

                        Release (MX00)
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("SMCF010"))
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y17)
                            IO (Decode16,
                                0x0158,             // Range Minimum
                                0x0158,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y18)
                            IRQNoFlags (_Y19)
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, _Y1A)
                                {3}
                        })
                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                            IRQNoFlags ()
                                {}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LNot (GP13))
                            {
                                Return (0x00)
                            }

                            If (CMBP)
                            {
                                ENCG ()
                                SDEV (0x05)
                                Store (ACTI, Local0)
                                Store (PWCT, Local1)
                                And (Local1, 0x20, Local1)
                                EXCG ()
                                If (LEqual (Local0, 0x00))
                                {
                                    Return (0x0D)
                                }

                                If (LNotEqual (Local1, 0x20))
                                {
                                    Return (0x0D)
                                }

                                Return (0x0F)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENCG ()
                            SDEV (0x05)
                            Store (0x00, ACTI)
                            Store (PWCT, Local0)
                            And (Local0, 0xDF, Local0)
                            Store (Local0, PWCT)
                            EXCG ()
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            If (LEqual (_STA (), 0x0F))
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO1.FIR._Y17._MIN, IOLO)
                                CreateByteField (BUF0, 0x03, IOHI)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO1.FIR._Y17._MAX, IORL)
                                CreateByteField (BUF0, 0x05, IORH)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO1.FIR._Y18._MIN, I2LO)
                                CreateByteField (BUF0, 0x0B, I2HI)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO1.FIR._Y18._MAX, I2RL)
                                CreateByteField (BUF0, 0x0D, I2RH)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO1.FIR._Y19._INT, IRQL)
                                CreateByteField (BUF0, 0x12, IRQH)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO1.FIR._Y1A._DMA, DMAC)
                                ENCG ()
                                SDEV (0x05)
                                Store (IOBH, Local0)
                                Store (Local0, IOHI)
                                Store (IOBL, Local0)
                                Store (Local0, IOLO)
                                Store (IOLO, IORL)
                                Store (IOHI, IORH)
                                Store (I2BH, Local0)
                                Store (Local0, I2HI)
                                Store (I2BL, Local0)
                                Store (Local0, I2LO)
                                Store (I2LO, I2RL)
                                Store (I2HI, I2RH)
                                Store (IRQX, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRQL)
                                Store (DMAX, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, DMAC)
                                EXCG ()
                                Return (BUF0)
                            }
                            Else
                            {
                                Return (RSRC)
                            }
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0158,             // Range Minimum
                                    0x0158,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0148,             // Range Minimum
                                    0x0148,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0258,             // Range Minimum
                                    0x0258,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0248,             // Range Minimum
                                    0x0248,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0158,             // Range Minimum
                                    0x0158,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0148,             // Range Minimum
                                    0x0148,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0258,             // Range Minimum
                                    0x0258,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0248,             // Range Minimum
                                    0x0248,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            EndDependentFn ()
                        })
                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x04, IORL)
                            CreateByteField (Arg0, 0x05, IORH)
                            CreateByteField (Arg0, 0x0A, I2LO)
                            CreateByteField (Arg0, 0x0B, I2HI)
                            CreateByteField (Arg0, 0x0C, I2RL)
                            CreateByteField (Arg0, 0x0D, I2RH)
                            CreateByteField (Arg0, 0x11, IRQL)
                            CreateByteField (Arg0, 0x12, IRQH)
                            CreateByteField (Arg0, 0x14, DMAC)
                            ENCG ()
                            SDEV (0x05)
                            Store (IOHI, Local0)
                            Store (Local0, IOBH)
                            Store (IOLO, Local0)
                            Store (Local0, IOBL)
                            Store (I2HI, Local0)
                            Store (Local0, I2BH)
                            Store (I2LO, Local0)
                            Store (Local0, I2BL)
                            FindSetRightBit (IRQL, Local0)
                            Decrement (Local0)
                            Store (Local0, IRQX)
                            FindSetRightBit (DMAC, Local0)
                            Decrement (Local0)
                            Store (Local0, DMAX)
                            EXCG ()
                            And (IOD0, 0x8F, IOD0)
                            If (LEqual (IOHI, 0x03))
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x00, IOD0)
                                    Store (0x58, GD3L)
                                }
                                Else
                                {
                                    Or (IOD0, 0x70, IOD0)
                                    Store (0x48, GD3L)
                                }

                                Store (0x02, GD3H)
                                Store (0x0C, GD3M)
                                Or (GD3L, 0x01, GD3L)
                            }
                            Else
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x10, IOD0)
                                    Store (0x58, GD3L)
                                }
                                Else
                                {
                                    Or (IOD0, 0x50, IOD0)
                                    Store (0x48, GD3L)
                                }

                                Store (0x01, GD3H)
                                Store (0x0C, GD3M)
                                Or (GD3L, 0x01, GD3L)
                            }
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            ENCG ()
                            And (PWCT, 0x20, Local0)
                            EXCG ()
                            If (Local0)
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                Return (0x03)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            ENCG ()
                            Or (PWCT, 0x20, PWCT)
                            EXCG ()
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            ENCG ()
                            And (PWCT, 0xDF, PWCT)
                            EXCG ()
                        }
                    }
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Name (_UID, 0x02)
                    Mutex (S217, 0x00)
                    OperationRegion (SMSC, SystemIO, 0x4E, 0x0100)
                    Field (SMSC, ByteAcc, Lock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, AnyAcc, NoLock, Preserve)
                    {
                                AccessAs (ByteAcc, 0x00), 
                                Offset (0x01), 
                            ,   2, 
                        LPD,    1, 
                        LMD,    1, 
                                Offset (0x02), 
                            ,   3, 
                        U1PD,   1, 
                            ,   3, 
                        U2PD,   1, 
                                Offset (0x04), 
                        LEMD,   2, 
                                Offset (0x05), 
                                Offset (0x0A), 
                            ,   6, 
                        IROM,   2, 
                                Offset (0x0C), 
                            ,   3, 
                        U2MD,   3, 
                                Offset (0x0D), 
                        CR0D,   8, 
                                Offset (0x23), 
                        CR23,   8, 
                        CR24,   8, 
                        CR25,   8, 
                        LDMA,   8, 
                        LIRQ,   8, 
                        CR28,   8, 
                                Offset (0x2B), 
                        CR2B,   8, 
                        CR2C,   8
                    }

                    Method (ENFG, 0, NotSerialized)
                    {
                        Store (0x55, INDX)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Store (0xAA, INDX)
                    }

                    Name (U1ST, 0x00)
                    Name (U2ST, 0x00)
                    Name (LST, 0x00)
                    Method (_INI, 0, NotSerialized)
                    {
                        Store (U1PD, U1ST)
                        Store (U2PD, U2ST)
                        Store (LPD, LST)
                    }

                    Device (UAR1)
                    {
                        Name (_HID, EisaId ("PNP0501"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (CMAP)
                            {
                                Acquire (S217, 0xFFFF)
                                ENFG ()
                                If (LNotEqual (U1PD, 0x00))
                                {
                                    Store (0x0F, Local1)
                                }
                                Else
                                {
                                    Store (0x0D, Local1)
                                }

                                EXFG ()
                                Release (S217)
                                Return (Local1)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            Store (0x00, U1PD)
                            Store (0x00, CR24)
                            Store (CR28, Local0)
                            And (Local0, 0x0F, Local0)
                            Store (Local0, CR28)
                            EXFG ()
                            Release (S217)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (RSRC, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    _Y1B)
                                IRQNoFlags (_Y1C)
                                    {}
                            })
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.UAR1._CRS._Y1B._MIN, IO1)
                            CreateByteField (RSRC, 0x03, IO2)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.UAR1._CRS._Y1B._MAX, IO3)
                            CreateByteField (RSRC, 0x05, IO4)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.UAR1._CRS._Y1C._INT, IRQV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            If (LNotEqual (U1PD, 0x00))
                            {
                                And (CR24, 0x3F, Local0)
                                ShiftLeft (Local0, 0x02, Local0)
                                Store (Local0, IO1)
                                Store (Local0, IO3)
                                ShiftRight (CR24, 0x06, Local0)
                                Store (Local0, IO2)
                                Store (Local0, IO4)
                                ShiftRight (CR28, 0x04, Local0)
                                ShiftLeft (0x01, Local0, IRQV)
                            }

                            EXFG ()
                            Release (S217)
                            Return (RSRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                        })
                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IO1)
                            CreateByteField (Arg0, 0x03, IO2)
                            CreateWordField (Arg0, 0x09, IRQV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            ShiftRight (IO1, 0x02, Local0)
                            ShiftLeft (IO2, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            Store (Local0, CR24)
                            FindSetRightBit (IRQV, Local0)
                            Subtract (Local0, 0x01, Local0)
                            ShiftLeft (Local0, 0x04, Local0)
                            And (CR28, 0x0F, Local1)
                            Or (Local0, Local1, CR28)
                            Store (0x01, U1PD)
                            EXFG ()
                            Release (S217)
                        }
                    }

                    Device (LPT)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LPTP)
                            {
                                Acquire (S217, 0xFFFF)
                                ENFG ()
                                If (LNotEqual (LMD, 0x01))
                                {
                                    Store (0x00, Local1)
                                }
                                Else
                                {
                                    If (LNotEqual (LST, 0x00))
                                    {
                                        Store (0x0F, Local1)
                                    }
                                    Else
                                    {
                                        Store (0x00, Local1)
                                    }
                                }

                                EXFG ()
                                Release (S217)
                                Return (Local1)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            Store (0x00, LPD)
                            EXFG ()
                            Release (S217)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (RSRC, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    _Y1D)
                                IRQNoFlags (_Y1E)
                                    {}
                            })
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.LPT._CRS._Y1D._MIN, IO1)
                            CreateByteField (RSRC, 0x03, IO2)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.LPT._CRS._Y1D._MAX, IO3)
                            CreateByteField (RSRC, 0x05, IO4)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.LPT._CRS._Y1E._INT, IRQV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            If (LEqual (LMD, 0x01))
                            {
                                If (LNotEqual (CR23, 0x00))
                                {
                                    ShiftLeft (CR23, 0x02, Local0)
                                    Store (Local0, IO1)
                                    Store (Local0, IO3)
                                    ShiftRight (CR23, 0x06, Local0)
                                    Store (Local0, IO2)
                                    Store (Local0, IO4)
                                    Store (0x01, Local0)
                                    And (LIRQ, 0x0F, Local1)
                                    ShiftLeft (Local0, Local1, IRQV)
                                }
                            }

                            EXFG ()
                            Release (S217)
                            Return (RSRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x08,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x08,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IO1)
                            CreateByteField (Arg0, 0x03, IO2)
                            CreateWordField (Arg0, 0x09, IRQV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            ShiftRight (IO1, 0x02, Local0)
                            ShiftLeft (IO2, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            Store (Local0, CR23)
                            FindSetRightBit (IRQV, Local0)
                            Subtract (Local0, 0x01, Local0)
                            And (LIRQ, 0xF0, Local1)
                            Or (Local0, Local1, LIRQ)
                            Store (0x01, LPD)
                            Store (0x01, LMD)
                            EXFG ()
                            Release (S217)
                        }
                    }

                    Device (LPBI)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x02)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LPTP)
                            {
                                Acquire (S217, 0xFFFF)
                                ENFG ()
                                If (LNotEqual (LMD, 0x00))
                                {
                                    Store (0x00, Local1)
                                }
                                Else
                                {
                                    If (LNotEqual (LEMD, 0x00))
                                    {
                                        Store (0x00, Local1)
                                    }
                                    Else
                                    {
                                        If (LNotEqual (LST, 0x00))
                                        {
                                            Store (0x0F, Local1)
                                        }
                                        Else
                                        {
                                            Store (0x00, Local1)
                                        }
                                    }
                                }

                                EXFG ()
                                Release (S217)
                                Return (Local1)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            Store (0x00, LPD)
                            EXFG ()
                            Release (S217)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (RSRC, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    _Y1F)
                                IRQNoFlags (_Y20)
                                    {}
                            })
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.LPBI._CRS._Y1F._MIN, IO1)
                            CreateByteField (RSRC, 0x03, IO2)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.LPBI._CRS._Y1F._MAX, IO3)
                            CreateByteField (RSRC, 0x05, IO4)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.LPBI._CRS._Y20._INT, IRQV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            If (And (LEqual (LMD, 0x00), LEqual (LEMD, 0x00)))
                            {
                                If (LNotEqual (CR23, 0x00))
                                {
                                    ShiftLeft (CR23, 0x02, Local0)
                                    Store (Local0, IO1)
                                    Store (Local0, IO3)
                                    ShiftRight (CR23, 0x06, Local0)
                                    Store (Local0, IO2)
                                    Store (Local0, IO4)
                                    Store (0x01, Local0)
                                    And (LIRQ, 0x0F, Local1)
                                    ShiftLeft (Local0, Local1, IRQV)
                                }
                            }

                            EXFG ()
                            Release (S217)
                            Return (RSRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x08,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x08,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IO1)
                            CreateByteField (Arg0, 0x03, IO2)
                            CreateWordField (Arg0, 0x09, IRQV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            ShiftRight (IO1, 0x02, Local0)
                            ShiftLeft (IO2, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            Store (Local0, CR23)
                            FindSetRightBit (IRQV, Local0)
                            Subtract (Local0, 0x01, Local0)
                            And (LIRQ, 0xF0, Local1)
                            Or (Local0, Local1, LIRQ)
                            Store (0x01, LPD)
                            Store (0x00, LMD)
                            Store (0x00, LEMD)
                            EXFG ()
                            Release (S217)
                        }
                    }

                    Device (EPP)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x03)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LPTP)
                            {
                                Acquire (S217, 0xFFFF)
                                ENFG ()
                                If (LNotEqual (LMD, 0x00))
                                {
                                    Store (0x00, Local1)
                                }
                                Else
                                {
                                    If (LNotEqual (LEMD, 0x01))
                                    {
                                        Store (0x00, Local1)
                                    }
                                    Else
                                    {
                                        If (LNotEqual (LST, 0x00))
                                        {
                                            Store (0x0F, Local1)
                                        }
                                        Else
                                        {
                                            Store (0x00, Local1)
                                        }
                                    }
                                }

                                EXFG ()
                                Release (S217)
                                Return (Local1)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            Store (0x00, LPD)
                            EXFG ()
                            Release (S217)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (RSRC, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    _Y21)
                                IRQNoFlags (_Y22)
                                    {}
                            })
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.EPP._CRS._Y21._MIN, IO1)
                            CreateByteField (RSRC, 0x03, IO2)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.EPP._CRS._Y21._MAX, IO3)
                            CreateByteField (RSRC, 0x05, IO4)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.EPP._CRS._Y22._INT, IRQV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            If (And (LEqual (LMD, 0x00), LEqual (LEMD, 0x01)))
                            {
                                If (LNotEqual (CR23, 0x00))
                                {
                                    ShiftLeft (CR23, 0x02, Local0)
                                    Store (Local0, IO1)
                                    Store (Local0, IO3)
                                    ShiftRight (CR23, 0x06, Local0)
                                    Store (Local0, IO2)
                                    Store (Local0, IO4)
                                    Store (0x01, Local0)
                                    And (LIRQ, 0x0F, Local1)
                                    ShiftLeft (Local0, Local1, IRQV)
                                }
                            }

                            EXFG ()
                            Release (S217)
                            Return (RSRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0178,             // Range Minimum
                                    0x0178,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0178,             // Range Minimum
                                    0x0178,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IO1)
                            CreateByteField (Arg0, 0x03, IO2)
                            CreateWordField (Arg0, 0x09, IRQV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            ShiftRight (IO1, 0x02, Local0)
                            ShiftLeft (IO2, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            Store (Local0, CR23)
                            FindSetRightBit (IRQV, Local0)
                            Subtract (Local0, 0x01, Local0)
                            And (LIRQ, 0xF0, Local1)
                            Or (Local0, Local1, LIRQ)
                            Store (0x01, LPD)
                            Store (0x00, LMD)
                            Store (0x01, LEMD)
                            EXFG ()
                            Release (S217)
                        }
                    }

                    Device (ECP)
                    {
                        Name (_HID, EisaId ("PNP0401"))
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LPTP)
                            {
                                Acquire (S217, 0xFFFF)
                                ENFG ()
                                If (LNotEqual (LMD, 0x00))
                                {
                                    Store (0x00, Local1)
                                }
                                Else
                                {
                                    If (LNotEqual (LEMD, 0x02))
                                    {
                                        Store (0x00, Local1)
                                    }
                                    Else
                                    {
                                        If (LNotEqual (LST, 0x00))
                                        {
                                            Store (0x0F, Local1)
                                        }
                                        Else
                                        {
                                            Store (0x00, Local1)
                                        }
                                    }
                                }

                                EXFG ()
                                Release (S217)
                                Return (Local1)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            Store (0x00, LPD)
                            EXFG ()
                            Release (S217)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (RSRC, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    _Y23)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    _Y24)
                                IRQNoFlags (_Y25)
                                    {}
                                DMA (Compatibility, NotBusMaster, Transfer16, _Y26)
                                    {}
                            })
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y23._MIN, IO1)
                            CreateByteField (RSRC, 0x03, IO2)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y23._MAX, IO3)
                            CreateByteField (RSRC, 0x05, IO4)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y23._ALN, ALB1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y23._LEN, LNB1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y24._MIN, IO5)
                            CreateByteField (RSRC, 0x0B, IO6)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y24._MAX, IO7)
                            CreateByteField (RSRC, 0x0D, IO8)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y24._ALN, ALB2)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y24._LEN, LNB2)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y25._INT, IRQV)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.ECP._CRS._Y26._DMA, DMAV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            If (And (LEqual (LMD, 0x00), LEqual (LEMD, 0x02)))
                            {
                                If (LNotEqual (CR23, 0x00))
                                {
                                    ShiftLeft (CR23, 0x02, Local0)
                                    Store (Local0, IO1)
                                    Store (Local0, IO3)
                                    Store (Local0, IO5)
                                    Store (Local0, IO7)
                                    If (LEqual (Local0, 0xBC))
                                    {
                                        Store (0x01, ALB1)
                                        Store (0x03, LNB1)
                                        Store (0x01, ALB2)
                                        Store (0x03, LNB2)
                                    }

                                    ShiftRight (CR23, 0x06, Local0)
                                    Store (Local0, IO2)
                                    Store (Local0, IO4)
                                    Add (Local0, 0x04, IO6)
                                    Add (Local0, 0x04, IO8)
                                    And (LIRQ, 0x0F, Local0)
                                    ShiftLeft (0x01, Local0, IRQV)
                                    And (LDMA, 0x0F, Local0)
                                    ShiftLeft (0x01, Local0, DMAV)
                                }
                            }

                            EXFG ()
                            Release (S217)
                            Return (RSRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQ (Edge, ActiveHigh, Exclusive, )
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer16, )
                                    {1,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQ (Edge, ActiveHigh, Exclusive, )
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer16, )
                                    {1,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQ (Edge, ActiveHigh, Exclusive, )
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer16, )
                                    {1,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQ (Edge, ActiveHigh, Exclusive, )
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer16, )
                                    {1,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQ (Edge, ActiveHigh, Exclusive, )
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer16, )
                                    {1,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQ (Edge, ActiveHigh, Exclusive, )
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer16, )
                                    {1,3}
                            }
                            EndDependentFn ()
                        })
                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IO1)
                            CreateByteField (Arg0, 0x03, IO2)
                            CreateWordField (Arg0, 0x11, IRQV)
                            CreateWordField (Arg0, 0x14, DMAV)
                            Acquire (S217, 0xFFFF)
                            ENFG ()
                            ShiftRight (IO1, 0x02, Local0)
                            ShiftLeft (IO2, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            Store (Local0, CR23)
                            FindSetRightBit (IRQV, Local0)
                            Subtract (Local0, 0x01, Local0)
                            And (LIRQ, 0xF0, Local1)
                            Or (Local0, Local1, LIRQ)
                            FindSetRightBit (DMAV, Local0)
                            Subtract (Local0, 0x01, Local0)
                            And (LIRQ, 0xF0, Local1)
                            Or (Local0, Local1, LIRQ)
                            Store (0x01, LPD)
                            Store (0x00, LMD)
                            Store (0x02, LEMD)
                            EXFG ()
                            Release (S217)
                        }
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("SYN1904"))
                    Name (_CID, Package (0x03)
                    {
                        0x00192E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }
            }

            Device (PATA)
            {
                Name (_ADR, 0x001F0001)
                OperationRegion (PACS, PCI_Config, 0x40, 0xC0)
                Field (PACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                            Offset (0x04), 
                    PSIT,   4, 
                            Offset (0x08), 
                    SYNC,   4, 
                            Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                            Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (PBUF, Buffer (0x14)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (PBUF, 0x00, PIO0)
                        CreateDWordField (PBUF, 0x04, DMA0)
                        CreateDWordField (PBUF, 0x08, PIO1)
                        CreateDWordField (PBUF, 0x0C, DMA1)
                        CreateDWordField (PBUF, 0x10, FLAG)
                        Store (GETP (PRIT), PIO0)
                        Store (GDMA (And (SYNC, 0x01), And (ICR3, 0x01), 
                            And (ICR0, 0x01), SDT0, And (ICR1, 0x01)), DMA0)
                        If (LEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (PIO0, DMA0)
                        }

                        If (And (PRIT, 0x4000))
                        {
                            If (LEqual (And (PRIT, 0x90), 0x80))
                            {
                                Store (0x0384, PIO1)
                            }
                            Else
                            {
                                Store (GETT (PSIT), PIO1)
                            }
                        }
                        Else
                        {
                            Store (0xFFFFFFFF, PIO1)
                        }

                        Store (GDMA (And (SYNC, 0x02), And (ICR3, 0x02), 
                            And (ICR0, 0x02), SDT1, And (ICR1, 0x02)), DMA1)
                        If (LEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (PIO1, DMA1)
                        }

                        Store (GETF (And (SYNC, 0x01), And (SYNC, 0x02), 
                            PRIT), FLAG)
                        If (And (LEqual (PIO0, 0xFFFFFFFF), LEqual (DMA0, 0xFFFFFFFF)))
                        {
                            Store (0x78, PIO0)
                            Store (0x14, DMA0)
                            Store (0x03, FLAG)
                        }

                        Return (PBUF)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, 0x00, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        If (LEqual (SizeOf (Arg1), 0x0200))
                        {
                            And (PRIT, 0x40F0, PRIT)
                            And (SYNC, 0x02, SYNC)
                            Store (0x00, SDT0)
                            And (ICR0, 0x02, ICR0)
                            And (ICR1, 0x02, ICR1)
                            And (ICR3, 0x02, ICR3)
                            And (ICR5, 0x02, ICR5)
                            CreateWordField (Arg1, 0x62, W490)
                            CreateWordField (Arg1, 0x6A, W530)
                            CreateWordField (Arg1, 0x7E, W630)
                            CreateWordField (Arg1, 0x80, W640)
                            CreateWordField (Arg1, 0xB0, W880)
                            CreateWordField (Arg1, 0xBA, W930)
                            Or (PRIT, 0x8004, PRIT)
                            If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                            {
                                Or (PRIT, 0x02, PRIT)
                            }

                            Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                            If (And (FLAG, 0x01))
                            {
                                Or (SYNC, 0x01, SYNC)
                                Store (SDMA (DMA0), SDT0)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x01, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x01, ICR0)
                                }

                                If (And (W930, 0x2000))
                                {
                                    Or (ICR1, 0x01, ICR1)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (PRIT, 0x3F0F, PRIT)
                            Store (0x00, PSIT)
                            And (SYNC, 0x01, SYNC)
                            Store (0x00, SDT1)
                            And (ICR0, 0x01, ICR0)
                            And (ICR1, 0x01, ICR1)
                            And (ICR3, 0x01, ICR3)
                            And (ICR5, 0x01, ICR5)
                            CreateWordField (Arg2, 0x62, W491)
                            CreateWordField (Arg2, 0x6A, W531)
                            CreateWordField (Arg2, 0x7E, W631)
                            CreateWordField (Arg2, 0x80, W641)
                            CreateWordField (Arg2, 0xB0, W881)
                            CreateWordField (Arg2, 0xBA, W931)
                            Or (PRIT, 0x8040, PRIT)
                            If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                            {
                                Or (PRIT, 0x20, PRIT)
                            }

                            If (And (FLAG, 0x10))
                            {
                                Or (PRIT, 0x4000, PRIT)
                                If (LGreater (PIO1, 0xF0))
                                {
                                    Or (PRIT, 0x80, PRIT)
                                }
                                Else
                                {
                                    Or (PRIT, 0x10, PRIT)
                                    Store (SETT (PIO1, W531, W641), PSIT)
                                }
                            }

                            If (And (FLAG, 0x04))
                            {
                                Or (SYNC, 0x02, SYNC)
                                Store (SDMA (DMA1), SDT1)
                                If (LLess (DMA1, 0x1E))
                                {
                                    Or (ICR3, 0x02, ICR3)
                                }

                                If (LLess (DMA1, 0x3C))
                                {
                                    Or (ICR0, 0x02, ICR0)
                                }

                                If (And (W931, 0x2000))
                                {
                                    Or (ICR1, 0x02, ICR1)
                                }
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB0, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            })
                            CreateByteField (PIB0, 0x01, PMD0)
                            CreateByteField (PIB0, 0x08, DMD0)
                            If (And (PRIT, 0x02))
                            {
                                If (LEqual (And (PRIT, 0x09), 0x08))
                                {
                                    Store (0x08, PMD0)
                                }
                                Else
                                {
                                    Store (0x0A, PMD0)
                                    ShiftRight (And (PRIT, 0x0300), 0x08, Local0)
                                    ShiftRight (And (PRIT, 0x3000), 0x0C, Local1)
                                    Add (Local0, Local1, Local2)
                                    If (LEqual (0x03, Local2))
                                    {
                                        Store (0x0B, PMD0)
                                    }

                                    If (LEqual (0x05, Local2))
                                    {
                                        Store (0x0C, PMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD0)
                            }

                            If (And (SYNC, 0x01))
                            {
                                Store (Or (SDT0, 0x40), DMD0)
                                If (And (ICR1, 0x01))
                                {
                                    If (And (ICR0, 0x01))
                                    {
                                        Add (DMD0, 0x02, DMD0)
                                    }

                                    If (And (ICR3, 0x01))
                                    {
                                        Store (0x45, DMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                            }

                            Return (PIB0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            })
                            CreateByteField (PIB1, 0x01, PMD1)
                            CreateByteField (PIB1, 0x08, DMD1)
                            If (And (PRIT, 0x20))
                            {
                                If (LEqual (And (PRIT, 0x90), 0x80))
                                {
                                    Store (0x08, PMD1)
                                }
                                Else
                                {
                                    Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                        0x02), Local0)
                                    If (LEqual (0x05, Local0))
                                    {
                                        Store (0x0C, PMD1)
                                    }
                                    Else
                                    {
                                        If (LEqual (0x03, Local0))
                                        {
                                            Store (0x0B, PMD1)
                                        }
                                        Else
                                        {
                                            Store (0x0A, PMD1)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD1)
                            }

                            If (And (SYNC, 0x02))
                            {
                                Store (Or (SDT1, 0x40), DMD1)
                                If (And (ICR1, 0x02))
                                {
                                    If (And (ICR0, 0x02))
                                    {
                                        Add (DMD1, 0x02, DMD1)
                                    }

                                    If (And (ICR3, 0x02))
                                    {
                                        Store (0x45, DMD1)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                            }

                            Return (PIB1)
                        }
                    }
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                            Offset (0x08), 
                    SYNC,   4, 
                            Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                            Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                            Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                            Offset (0x50), 
                    MAPV,   2
                }
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)
                OperationRegion (SMBP, PCI_Config, 0x40, 0xC0)
                Field (SMBP, DWordAcc, NoLock, Preserve)
                {
                        ,   2, 
                    I2CE,   1
                }

                OperationRegion (SMBI, SystemIO, 0x18E0, 0x10)
                Field (SMBI, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                            Offset (0x02), 
                    HCON,   8, 
                    HCOM,   8, 
                    TXSA,   8, 
                    DAT0,   8, 
                    DAT1,   8, 
                    HBDR,   8, 
                    PECR,   8, 
                    RXSA,   8, 
                    SDAT,   16
                }

                Method (SSXB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRXB, 1, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (0x44, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (DAT0)
                    }

                    Return (0xFFFF)
                }

                Method (SWRB, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (Arg2, DAT0)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRDB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (DAT0)
                    }

                    Return (0xFFFF)
                }

                Method (SBLW, 4, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg3, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (SizeOf (Arg2), DAT0)
                    Store (0x00, Local1)
                    Store (DerefOf (Index (Arg2, 0x00)), HBDR)
                    Store (0x54, HCON)
                    While (LGreater (SizeOf (Arg2), Local1))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (0x80, HSTS)
                        Increment (Local1)
                        If (LGreater (SizeOf (Arg2), Local1))
                        {
                            Store (DerefOf (Index (Arg2, Local1)), HBDR)
                        }
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SBLR, 3, Serialized)
                {
                    Name (TBUF, Buffer (0x0100) {})
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg2, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x54, HCON)
                    Store (0x0FA0, Local0)
                    While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                    {
                        Decrement (Local0)
                        Stall (0x32)
                    }

                    If (LNot (Local0))
                    {
                        KILL ()
                        Return (0x00)
                    }

                    Store (DAT0, Index (TBUF, 0x00))
                    Store (0x80, HSTS)
                    Store (0x01, Local1)
                    While (LLess (Local1, DerefOf (Index (TBUF, 0x00))))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (HBDR, Index (TBUF, Local1))
                        Store (0x80, HSTS)
                        Increment (Local1)
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (TBUF)
                    }

                    Return (0x00)
                }

                Method (STRT, 0, Serialized)
                {
                    Store (0xC8, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x40))
                        {
                            Decrement (Local0)
                            Sleep (0x01)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x01)
                            }
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }
                    }

                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x01))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Return (0x01)
                }

                Method (COMP, 0, Serialized)
                {
                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x02))
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                    }

                    Return (0x00)
                }

                Method (KILL, 0, Serialized)
                {
                    Or (HCON, 0x02, HCON)
                    Or (HSTS, 0xFF, HSTS)
                }
            }
        }
    }
}

