/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080213
 *
 * Disassembly of v3505, Mon Mar 10 22:15:34 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00006133 (24883)
 *     Revision         0x01
 *     Checksum         0xA9
 *     OEM ID           "WS    "
 *     OEM Table ID     "Y40     "
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000E (16777230)
 */
DefinitionBlock ("v3505.aml", "DSDT", 1, "WS    ", "Y40     ", 0x06040000)
{
    External (PDC1)
    External (PDC0)
    External (CFGD)

    OperationRegion (PORT, SystemIO, 0x80, 0x01)
    Field (PORT, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
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
                Offset (0x0E), 
        GL02,   8, 
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
            ,   7, 
        GP39,   1, 
        GL05,   8, 
        GL06,   8, 
        GL07,   8
    }

    OperationRegion (GNVS, SystemMemory, 0x3F698E4C, 0x0100)
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
        LINX,   8, 
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
                Offset (0x1E), 
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
        PCP0,   8, 
        PCP1,   8, 
                Offset (0x32), 
        NATP,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
        CMCP,   8, 
        CIRP,   8, 
        LPTM,   8, 
        LPTA,   8, 
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
                Offset (0x78), 
        TPMP,   8, 
        TPME,   8, 
                Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
                Offset (0x96), 
        C4EN,   8
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

    Mutex (MSMI, 0x07)
    Method (PHSR, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, PRM0)
        Store (Arg0, SMIF)
        Store (Zero, TRP0)
        Store (PRM0, Local0)
        Release (MSMI)
        Return (Local0)
    }

    Method (HKEY, 1, NotSerialized)
    {
        PHSR (0x1E, Arg0)
    }

    Method (LAMN, 1, NotSerialized)
    {
        PHSR (0x1F, Arg0)
    }

    Method (RBEC, 1, NotSerialized)
    {
        Return (PHSR (0x20, Arg0))
    }

    Method (WBEC, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, PRM1)
        Store (Arg0, PRM0)
        Store (0x21, SMIF)
        Store (Zero, TRP0)
        Release (MSMI)
    }

    Method (MBEC, 3, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg2, PRM2)
        Store (Arg1, PRM1)
        Store (Arg0, PRM0)
        Store (0x22, SMIF)
        Store (Zero, TRP0)
        Release (MSMI)
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
    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06) {}
        Processor (CPU1, 0x01, 0x00001010, 0x06) {}
    }

    Name (\DSEN, 0x01)
    Name (\ECON, 0x00)
    Name (\GPIC, 0x00)
    Name (\CTYP, 0x00)
    Name (\L01C, 0x00)
    Name (\VFN0, 0x00)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Name (FWSO, "FWSO")
    Name (_PSC, 0x00)
    Method (_PS0, 0, NotSerialized)
    {
        Store (_PSC, Local0)
        Store (0x00, _PSC)
    }

    Method (_PS3, 0, NotSerialized)
    {
        Store (0x03, _PSC)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        HKEY (0x8E)
        Store (Arg0, \_SB.PCI0.LPCB.EC0.SYSC)
        If (\ECON)
        {
            Store (0x01, \_SB.PCI0.LPCB.EC0.MUTE)
        }
        Else
        {
            \MBEC (0x71, 0xF7, 0x08)
        }

        If (LEqual (Arg0, 0x05))
        {
            PHSR (0x31, 0x00)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        Store (Arg0, \_SB.PCI0.LPCB.EC0.SYSO)
        \_SB.PCI0.LPCB.EC0.TINI ()
        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LAnd (LEqual (OSYS, 0x07D1), 
                    LNot (And (PDC0, 0x10)))))
                {
                    PHSR (0x3D, 0x00)
                }
            }
        }

        If (LEqual (RP1D, 0x00))
        {
            Notify (\_SB.PCI0.RP01, 0x00)
        }

        If (LEqual (RP2D, 0x00))
        {
            Notify (\_SB.PCI0.RP02, 0x00)
        }

        If (LEqual (RP3D, 0x00))
        {
            Notify (\_SB.PCI0.RP03, 0x00)
        }

        If (LEqual (RP4D, 0x00))
        {
            Notify (\_SB.PCI0.RP04, 0x00)
        }

        If (LEqual (RP5D, 0x00))
        {
            Notify (\_SB.PCI0.RP05, 0x00)
        }

        If (LEqual (RP6D, 0x00))
        {
            Notify (\_SB.PCI0.RP06, 0x00)
        }

        If (LEqual (Arg0, 0x03))
        {
            If (LEqual (0x00, ACTT)) {}
        }

        If (LEqual (Arg0, 0x04))
        {
            PHSR (0x2F, 0x00)
            If (DTSE) {}
            Notify (\_TZ.TZS0, 0x80)
            If (LEqual (OSYS, 0x07D2))
            {
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
        }

        Return (Package (0x02)
        {
            0x00, 
            0x00
        })
    }

    Scope (\_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Add (L01C, 0x01, L01C)
            Store (0x01, P80H)
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

            If (LAnd (LEqual (RP5D, 0x00), \_SB.PCI0.RP05.HPCS))
            {
                If (\_SB.PCI0.RP05.PDC5)
                {
                    Store (0x01, \_SB.PCI0.RP05.PDC5)
                    Store (0x01, \_SB.PCI0.RP05.HPCS)
                    Notify (\_SB.PCI0.RP05, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP05.HPCS)
                }
            }

            If (LAnd (LEqual (RP6D, 0x00), \_SB.PCI0.RP06.HPCS))
            {
                If (\_SB.PCI0.RP06.PDC6)
                {
                    Store (0x01, \_SB.PCI0.RP06.PDC6)
                    Store (0x01, \_SB.PCI0.RP06.HPCS)
                    Notify (\_SB.PCI0.RP06, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP06.HPCS)
                }
            }
        }

        Method (_L02, 0, NotSerialized)
        {
            Store (0x02, P80H)
            Store (0x00, GPEC)
            Notify (\_TZ.TZS0, 0x80)
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

        Method (_L07, 0, NotSerialized)
        {
            Store (0x20, \_SB.PCI0.SBUS.HSTS)
        }

        Method (_L08, 0, NotSerialized)
        {
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

            If (\_SB.PCI0.RP05.PSP5)
            {
                Store (0x01, \_SB.PCI0.RP05.PSP5)
                Store (0x01, \_SB.PCI0.RP05.PMCS)
                Notify (\_SB.PCI0.RP05, 0x02)
            }

            If (\_SB.PCI0.RP06.PSP6)
            {
                Store (0x01, \_SB.PCI0.RP06.PSP6)
                Store (0x01, \_SB.PCI0.RP06.PMCS)
                Notify (\_SB.PCI0.RP06, 0x02)
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
            Store (0x19, P80H)
            Notify (\_SB.SLPB, 0x02)
        }
    }

    Method (BRTW, 1, Serialized)
    {
        Store (Arg0, Local1)
        If (LEqual (ALSE, 0x02))
        {
            Store (Divide (Multiply (ALAF, Arg0), 0x64, ), Local1)
            If (LGreater (Local1, 0x64))
            {
                Store (0x64, Local1)
            }
        }

        Store (Divide (Multiply (0xFF, Local1), 0x64, ), Local0)
        Store (Local0, PRM0)
        If (LEqual (PHSR (0x12, 0x00), 0x00))
        {
            Store (Arg0, BRTL)
        }
    }

    Method (GETB, 3, Serialized)
    {
        Multiply (Arg0, 0x08, Local0)
        Multiply (Arg1, 0x08, Local1)
        CreateField (Arg2, Local0, Local1, TBF3)
        Return (TBF3)
    }

    Method (HKDS, 1, Serialized)
    {
        If (LEqual (0x00, DSEN))
        {
            If (LEqual (PHSR (Arg0, 0x00), 0x00))
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
            If (LEqual (PHSR (Increment (Arg0), 0x00), 0x00))
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

    Scope (\_TZ)
    {
        Name (TBSE, 0x0AAC)
        Name (CRT0, 0x00)
        Name (PSV0, 0x00)
        Name (PSVA, 0x00)
        ThermalZone (TZS0)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.EC0.THS0, Local0)
                    Store (\_SB.PCI0.LPCB.EC0.KCSS, Local1)
                    Store (\_SB.PCI0.LPCB.EC0.KOSD, Local2)
                }
                Else
                {
                    Store (RBEC (0x92), Local0)
                    And (Local0, 0x01, Local1)
                    And (Local0, 0x08, Local2)
                    Store (RBEC (0xA8), Local0)
                }

                If (Local2)
                {
                    If (LLessEqual (Local0, CRT0))
                    {
                        Add (CRT0, 0x02, Local0)
                    }
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.LPCB.EC0.TIID)
                    Store (\_SB.PCI0.LPCB.EC0.TSC0, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Store (RBEC (0xD1), Local0)
                }

                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x78, Local0)
                }

                Store (Local0, CRT0)
                Return (C2K (Local0))
            }
        }

        ThermalZone (TZS1)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.EC0.THS1, Local0)
                }
                Else
                {
                    Store (RBEC (0xA9), Local0)
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.LPCB.EC0.TIID)
                    Store (\_SB.PCI0.LPCB.EC0.TSC1, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Store (RBEC (0xD3), Local0)
                }

                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x78, Local0)
                }

                Return (C2K (Local0))
            }
        }

        Method (C2K, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            If (LLessEqual (Local0, 0x10))
            {
                Store (0x1E, Local0)
            }

            If (LGreaterEqual (Local0, 0x7F))
            {
                Store (0x1E, Local0)
            }

            Add (Multiply (Local0, 0x0A), TBSE, Local0)
            Return (Local0)
        }

        Method (SPSV, 2, NotSerialized)
        {
            ShiftLeft (0x01, Arg0, Local0)
            If (Arg1)
            {
                Or (PSVA, Local0, PSVA)
            }
            Else
            {
                And (PSVA, Not (Local0), PSVA)
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

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)
        {
            If (DTSE) {}
            Store (0x07D0, OSYS)
            If (CondRefOf (_OSI, Local0))
            {
                Store (0x07D1, OSYS)
                If (LAnd (MPEN, LEqual (OSYS, 0x07D1)))
                {
                    PHSR (0x3D, 0x00)
                }
            }
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.EC0.KLID, Local0)
                }
                Else
                {
                    And (\RBEC (0x70), 0x02, Local0)
                }

                If (Local0)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_PSW, 1, NotSerialized)
            {
                If (\ECON)
                {
                    Store (Arg0, \_SB.PCI0.LPCB.EC0.LIDW)
                }
                Else
                {
                    If (Arg0)
                    {
                        \MBEC (0x72, 0xEF, 0x10)
                    }
                    Else
                    {
                        \MBEC (0x72, 0xEF, 0x00)
                    }
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x19, 
                0x03
            })
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Name (_PRW, Package (0x02)
            {
                0x19, 
                0x03
            })
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Device (MCHC)
            {
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
                    TOUD,   5, 
                            Offset (0xA4), 
                        ,   6, 
                    IGDD,   1
                }
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
                If (^MCHC.PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (^MCHC.PM1L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (^MCHC.PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (^MCHC.PM1H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (^MCHC.PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (^MCHC.PM2L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (^MCHC.PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (^MCHC.PM2H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (^MCHC.PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (^MCHC.PM3L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (^MCHC.PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (^MCHC.PM3H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (^MCHC.PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (^MCHC.PM4L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (^MCHC.PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (^MCHC.PM4H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (^MCHC.PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (^MCHC.PM5L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (^MCHC.PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (^MCHC.PM5H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (^MCHC.PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (^MCHC.PM6L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (^MCHC.PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (^MCHC.PM6H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (^MCHC.PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (^MCHC.PM0H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, M1LN)
                ShiftLeft (^MCHC.TOUD, 0x1B, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x11)
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
                            0x0002FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            0x00, 
                            0x15
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
                            0x11
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
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            0x00, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            0x00, 
                            0x15
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
                    Return (Package (0x11)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKF, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKF, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKF, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }
                    })
                }
            }

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x01)
                Name (BUF0, ResourceTemplate ()
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
                        0xFED40000,         // Address Base
                        0x00005000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x0004B000,         // Address Length
                        )
                })
                Name (BUF1, ResourceTemplate ()
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
                Method (_CRS, 0, Serialized)
                {
                    If (LNot (TPMP))
                    {
                        Return (BUF0)
                    }

                    Return (BUF1)
                }
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (PHSR (0x30, 0x00), 0x00))
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
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
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (PHSR (0x30, 0x00), 0x01))
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x03), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x04)
                    {
                        0x0100, 
                        0x0410, 
                        0x0240, 
                        0x0320
                    })
                }

                Device (CRT)
                {
                    Name (_ADR, 0x0100)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0101))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0101))
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

                Device (TV0)
                {
                    Name (_ADR, 0x0240)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0202))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0202))
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

                Device (DVI)
                {
                    Name (_ADR, 0x0320)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0404))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0404))
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

                Device (LCD)
                {
                    Name (_ADR, 0x0410)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0808))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0808))
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
                    0x03
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
                    If (\GPIC)
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
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKD, 
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
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (\GPIC)
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
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKA, 
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
                    If (\GPIC)
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
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKB, 
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
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (\GPIC)
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
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP05)
            {
                Name (_ADR, 0x001C0004)
                OperationRegion (P5CS, PCI_Config, 0x40, 0x0100)
                Field (P5CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP5,   1, 
                        ,   2, 
                    PDC5,   1, 
                        ,   2, 
                    PDS5,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP5,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS5)
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
                    If (\GPIC)
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
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP06)
            {
                Name (_ADR, 0x001C0005)
                OperationRegion (P6CS, PCI_Config, 0x40, 0x0100)
                Field (P6CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP6,   1, 
                        ,   2, 
                    PDC6,   1, 
                        ,   2, 
                    PDS6,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP6,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS6)
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
                    If (\GPIC)
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
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

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
                OperationRegion (U2CS, PCI_Config, 0xC4, 0x04)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                    U2EN,   2
                }

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
                OperationRegion (U2CS, PCI_Config, 0xC4, 0x04)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                    U3EN,   2
                }

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
                OperationRegion (U4CS, PCI_Config, 0xC4, 0x04)
                Field (U4CS, DWordAcc, NoLock, Preserve)
                {
                    U4EN,   2
                }

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
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x16
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
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x03, 
                                0x00, 
                                0x14
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (CBS0)
            {
                Name (_ADR, 0x00090000)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x03)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x03)
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
                    LDE0,   8, 
                    LDE1,   8
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                    Name (_GPE, 0x17)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                    OperationRegion (ECO1, SystemIO, 0x62, 0x01)
                    Field (ECO1, ByteAcc, Lock, Preserve)
                    {
                        PX62,   8
                    }

                    OperationRegion (ECO2, SystemIO, 0x66, 0x01)
                    Field (ECO2, ByteAcc, Lock, Preserve)
                    {
                        PX66,   8
                    }

                    OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x0A), 
                            ,   1, 
                        BLNK,   1, 
                        WLLD,   2, 
                        BTLD,   2, 
                                Offset (0x12), 
                            ,   1, 
                        PLB1,   1, 
                                Offset (0x70), 
                            ,   1, 
                        KLID,   1, 
                            ,   3, 
                        KACS,   1, 
                                Offset (0x71), 
                        WLEN,   1, 
                        BTEN,   1, 
                        DCKS,   1, 
                        MUTE,   1, 
                        KBID,   3, 
                                Offset (0x72), 
                            ,   2, 
                        KEYW,   1, 
                        RTCW,   1, 
                        LIDW,   1, 
                        BL2W,   1, 
                        TPDW,   1, 
                                Offset (0x75), 
                        SWBL,   1, 
                        KLMA,   1, 
                                Offset (0x76), 
                        SYSC,   4, 
                        SYSO,   4
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x01), 
                        TIID,   8, 
                                Offset (0x10), 
                            ,   1, 
                        KTEE,   1, 
                                Offset (0x11), 
                        KPPS,   1, 
                                Offset (0x91), 
                        TTID,   8, 
                        KCSS,   1, 
                        KCTT,   1, 
                        KDTT,   1, 
                        KOSD,   1, 
                        KVTP,   1, 
                                Offset (0xA8), 
                        THS0,   8, 
                        THS1,   8, 
                        THS2,   8, 
                        THS3,   8, 
                        THS4,   8, 
                        THS5,   8, 
                        THS6,   8, 
                        THS7,   8
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x92), 
                        KTAF,   8
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x92), 
                        THSL,   4
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0xD0), 
                        TSP0,   8, 
                        TSC0,   8, 
                        TSP1,   8, 
                        TSC1,   8, 
                        TSP2,   8, 
                        TSC2,   8, 
                        TSP3,   8, 
                        TSC3,   8, 
                        TSP4,   8, 
                        TSC4,   8, 
                        TSP5,   8, 
                        TSC5,   8, 
                        TSP6,   8, 
                        TSC6,   8, 
                        TSP7,   8, 
                        TSC7,   8
                    }

                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECON)
                            TINI ()
                            Store (0x05, SYSO)
                        }
                    }

                    Method (TINI, 0, NotSerialized)
                    {
                        If (\ECON)
                        {
                            Store (0x00, KTAF)
                            Store (0x01, KTEE)
                        }
                        Else
                        {
                            WBEC (0x92, 0x00)
                            MBEC (0x10, 0xFD, 0x02)
                        }
                    }

                    Method (_Q16, 0, NotSerialized)
                    {
                        Store (0x16, P80H)
                        LAMN (0x01)
                    }

                    Method (_Q24, 0, NotSerialized)
                    {
                        Store (0x24, P80H)
                        LAMN (0x6A)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Store (0x25, P80H)
                        LAMN (0x6D)
                    }

                    Method (_Q17, 0, NotSerialized)
                    {
                        Store (0x17, P80H)
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (HKDS, 1, NotSerialized)
                    {
                        If (LEqual (0x00, DSEN))
                        {
                            If (LEqual (Arg0, 0x10))
                            {
                                Store (PHSR (0x27, 0x00), Local0)
                                Increment (Local0)
                                If (LGreaterEqual (Local0, 0x03))
                                {
                                    Store (0x00, Local0)
                                }
                            }
                            Else
                            {
                                Store (Arg0, Local0)
                            }

                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x0101, NSTE)
                            }

                            If (LEqual (Local0, 0x01))
                            {
                                Store (0x0808, NSTE)
                            }

                            If (LEqual (Local0, 0x02))
                            {
                                Store (0x0909, NSTE)
                            }

                            If (LEqual (Local0, 0x03))
                            {
                                Store (0x0404, NSTE)
                            }

                            If (LEqual (Local0, 0x04))
                            {
                                Store (0x0202, NSTE)
                            }

                            If (LEqual (Local0, 0x05))
                            {
                                Store (0x0C0C, NSTE)
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                Store (0x0A0A, NSTE)
                            }

                            If (LEqual (\_SB.PCI0.MCHC.IGDD, 0x00))
                            {
                                Notify (\_SB.PCI0.GFX0, 0x80)
                            }
                            Else
                            {
                            }
                        }

                        If (LEqual (0x01, DSEN))
                        {
                            If (LEqual (Arg0, 0x10))
                            {
                                PHSR (0x26, 0x00)
                            }
                            Else
                            {
                                PHSR (0x28, Arg0)
                            }
                        }
                    }

                    Method (_Q19, 0, NotSerialized)
                    {
                        Store (0x19, P80H)
                        HKDS (0x10)
                    }

                    Method (_Q80, 0, NotSerialized)
                    {
                        Store (0x80, P80H)
                        HKDS (0x00)
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        Store (0x81, P80H)
                        HKDS (0x01)
                    }

                    Method (_Q82, 0, NotSerialized)
                    {
                        Store (0x82, P80H)
                        HKDS (0x02)
                    }

                    Method (_Q83, 0, NotSerialized)
                    {
                        Store (0x83, P80H)
                        HKDS (0x03)
                    }

                    Method (_Q84, 0, NotSerialized)
                    {
                        Store (0x84, P80H)
                        HKDS (0x04)
                    }

                    Method (_Q85, 0, NotSerialized)
                    {
                        Store (0x85, P80H)
                        HKDS (0x05)
                    }

                    Method (_Q86, 0, NotSerialized)
                    {
                        Store (0x86, P80H)
                        HKDS (0x06)
                    }

                    Method (_Q1A, 0, NotSerialized)
                    {
                        Store (0x1A, P80H)
                        LAMN (0x06)
                    }

                    Method (_Q5C, 0, NotSerialized)
                    {
                        Store (0x5C, P80H)
                        HKEY (0x5C)
                    }

                    Method (_Q1E, 0, NotSerialized)
                    {
                        Store (0x1E, P80H)
                        LAMN (0x20)
                    }

                    Method (_Q1F, 0, NotSerialized)
                    {
                        Store (0x1F, P80H)
                        LAMN (0x21)
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Store (0x22, P80H)
                        LAMN (0x07)
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0x10, P80H)
                        LAMN (0x30)
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x11, P80H)
                        LAMN (0x36)
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x12, P80H)
                        LAMN (0x31)
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Store (0x13, P80H)
                        LAMN (0x11)
                    }

                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (0x14, P80H)
                        LAMN (0x12)
                    }

                    Method (_Q15, 0, NotSerialized)
                    {
                        Store (0x15, P80H)
                        LAMN (0x13)
                    }

                    Method (_Q1B, 0, NotSerialized)
                    {
                        Store (0x1B, P80H)
                        LAMN (0x08)
                    }

                    Method (_Q23, 0, NotSerialized)
                    {
                        Store (0x23, P80H)
                        LAMN (0x44)
                    }

                    Method (_Q2A, 0, NotSerialized)
                    {
                        Store (0x2A, P80H)
                        LAMN (0x78)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x32, P80H)
                        HKEY (0x32)
                        Store (0x00, KCTT)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, P80H)
                        Store (0x00, KCSS)
                        NGV3 (0x00, 0x00)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, P80H)
                        Store (0x01, KCSS)
                        NGV3 (0x00, 0x01)
                    }

                    Method (_Q35, 0, NotSerialized)
                    {
                        Store (0x35, P80H)
                        HKEY (0x35)
                        Store (0x01, KCTT)
                    }

                    Method (_Q36, 0, NotSerialized)
                    {
                        Store (0x36, P80H)
                        Store (0x01, KOSD)
                        Sleep (0x01F4)
                        NTMR ()
                    }

                    Method (_Q39, 0, NotSerialized)
                    {
                        Store (0x39, P80H)
                        Store (0x01, KPPS)
                        NGV3 (0x11, 0x01)
                    }

                    Method (_Q3A, 0, NotSerialized)
                    {
                        Store (0x3A, P80H)
                        Store (0x00, KPPS)
                        NGV3 (0x11, 0x00)
                    }

                    Method (_Q3F, 0, NotSerialized)
                    {
                        Store (0x3F, P80H)
                        HKEY (0x3F)
                    }

                    Method (_Q40, 0, NotSerialized)
                    {
                        Store (0x40, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
                    }

                    Method (_Q41, 0, NotSerialized)
                    {
                        Store (0x41, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
                    }

                    Method (_Q48, 0, NotSerialized)
                    {
                        Store (0x48, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x80)
                    }

                    Method (_Q4C, 0, NotSerialized)
                    {
                        Store (0x4C, P80H)
                        If (B0ST)
                        {
                            Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x80)
                        }
                    }

                    Method (_Q50, 0, NotSerialized)
                    {
                        Store (0x50, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.ADP1, 0x80)
                    }

                    Method (_Q51, 0, NotSerialized)
                    {
                        Store (0x51, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.ADP1, 0x80)
                    }

                    Method (_Q52, 0, NotSerialized)
                    {
                        Store (0x52, P80H)
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (_Q53, 0, NotSerialized)
                    {
                        Store (0x53, P80H)
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (NTMR, 0, NotSerialized)
                    {
                        Notify (\_TZ.TZS0, 0x80)
                        Notify (\_TZ.TZS1, 0x80)
                    }

                    Method (SGV3, 1, NotSerialized)
                    {
                        If (LGreater (Arg0, 0x64))
                        {
                            Store (PPCM, PPCS)
                        }
                        Else
                        {
                            Store (Arg0, PPCS)
                        }

                        Notify (\_PR.CPU0, 0x80)
                        If (MPEN)
                        {
                            Notify (\_PR.CPU1, 0x80)
                        }
                    }

                    Method (NGV3, 2, NotSerialized)
                    {
                        \_TZ.SPSV (Arg0, Arg1)
                        If (\_TZ.PSVA)
                        {
                            SGV3 (0xFF)
                        }
                        Else
                        {
                            SGV3 (0x00)
                        }
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x02), 
                        NBID,   8, 
                                Offset (0x17), 
                            ,   5, 
                        SM0F,   1, 
                            ,   1, 
                        SM1F,   1, 
                                Offset (0x88), 
                        NB0A,   1, 
                            ,   2, 
                        NB0R,   1, 
                        NB0L,   1, 
                        NB0F,   1, 
                        NB0N,   1, 
                                Offset (0x89), 
                        NB1A,   1, 
                            ,   2, 
                        NB1R,   1, 
                        NB1L,   1, 
                        NB1F,   1, 
                        NB1N,   1
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x88), 
                        NB0S,   8, 
                        NB1S,   8
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0xE0), 
                        BSRC,   16, 
                        BSFC,   16, 
                        BSPE,   16, 
                        BSAC,   16, 
                        BSVO,   16, 
                            ,   15, 
                        BSCM,   1, 
                        BSCU,   16, 
                        BSTV,   16
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0xE0), 
                        BSDC,   16, 
                        BSDV,   16, 
                        BSSN,   16
                    }

                    Field (RAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0xE0), 
                        BSMN,   128
                    }

                    Field (RAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0xE0), 
                        BSDN,   128
                    }

                    Field (RAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0xE0), 
                        BSCH,   128
                    }

                    Mutex (BATM, 0x07)
                    Method (GBIF, 3, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If (Arg2)
                        {
                            Store (0xFFFFFFFF, Index (Arg1, 0x01))
                            Store (0xFFFFFFFF, Index (Arg1, 0x02))
                            Store (0xFFFFFFFF, Index (Arg1, 0x04))
                            Store (0x00, Index (Arg1, 0x05))
                            Store (0x00, Index (Arg1, 0x06))
                        }
                        Else
                        {
                            And (Arg0, 0xF0, NBID)
                            Store (BSCM, Local0)
                            XOr (Local0, 0x01, Index (Arg1, 0x00))
                            Or (Arg0, 0x01, NBID)
                            If (Local0)
                            {
                                Multiply (BSDC, 0x0A, Local1)
                            }
                            Else
                            {
                                Store (BSDC, Local1)
                            }

                            Store (Local1, Index (Arg1, 0x01))
                            And (Arg0, 0xF0, NBID)
                            If (Local0)
                            {
                                Multiply (BSFC, 0x0A, Local2)
                            }
                            Else
                            {
                                Store (BSFC, Local2)
                            }

                            Store (Local2, Index (Arg1, 0x02))
                            Or (Arg0, 0x01, NBID)
                            Store (BSDV, Index (Arg1, 0x04))
                            Divide (Local2, 0x64, Local7, Local6)
                            Multiply (Local6, 0x05, Local3)
                            Store (Local3, Index (Arg1, 0x05))
                            Multiply (0x03, 0x02, Local4)
                            Add (Local4, 0x01, Local4)
                            Multiply (Local6, Local4, Local4)
                            Divide (Local4, 0x02, Local7, Local4)
                            Store (Local4, Index (Arg1, 0x06))
                            Subtract (Local3, Local4, Index (Arg1, 0x07))
                            Subtract (Local2, Local3, Index (Arg1, 0x08))
                            Store (BSSN, Local7)
                            Name (SERN, Buffer (0x06)
                            {
                                "     "
                            })
                            Store (0x04, Local6)
                            While (Local7)
                            {
                                Divide (Local7, 0x0A, Local5, Local7)
                                Add (Local5, 0x30, Index (SERN, Local6))
                                Decrement (Local6)
                            }

                            Store (SERN, Index (Arg1, 0x0A))
                            Or (Arg0, 0x03, NBID)
                            Store (BSDN, Index (Arg1, 0x09))
                            Or (Arg0, 0x04, NBID)
                            Store (BSCH, Index (Arg1, 0x0B))
                            Or (Arg0, 0x02, NBID)
                            Store (BSMN, Index (Arg1, 0x0C))
                        }

                        Release (BATM)
                        Return (Arg1)
                    }

                    Method (GBST, 4, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If (And (Arg1, 0x02))
                        {
                            Store (0x02, Local0)
                            If (And (Arg1, 0x20))
                            {
                                Store (0x00, Local0)
                            }
                        }
                        Else
                        {
                            If (And (Arg1, 0x04))
                            {
                                Store (0x01, Local0)
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }
                        }

                        If (And (Arg1, 0x10))
                        {
                            Or (Local0, 0x04, Local0)
                        }

                        If (And (Arg1, 0x01))
                        {
                            And (Arg0, 0xF0, NBID)
                            Store (BSAC, Local1)
                            Store (BSRC, Local2)
                            If (ACST)
                            {
                                If (And (Arg1, 0x20))
                                {
                                    Store (BSFC, Local2)
                                }
                            }

                            If (Arg2)
                            {
                                Multiply (Local2, 0x0A, Local2)
                            }

                            Store (BSVO, Local3)
                            If (LGreaterEqual (Local1, 0x8000))
                            {
                                If (And (Local0, 0x01))
                                {
                                    Subtract (0x00010000, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                If (LEqual (And (Local0, 0x02), 0x00))
                                {
                                    Store (0x00, Local1)
                                }
                            }

                            If (Arg2)
                            {
                                Multiply (Local3, Local1, Local1)
                                Divide (Local1, 0x03E8, Local7, Local1)
                            }
                        }
                        Else
                        {
                            Store (0x00, Local0)
                            Store (0xFFFFFFFF, Local1)
                            Store (0xFFFFFFFF, Local2)
                            Store (0xFFFFFFFF, Local3)
                        }

                        Store (Local0, Index (Arg3, 0x00))
                        Store (Local1, Index (Arg3, 0x01))
                        Store (Local2, Index (Arg3, 0x02))
                        Store (Local3, Index (Arg3, 0x03))
                        Release (BATM)
                        Return (Arg3)
                    }

                    Name (B0ST, 0x00)
                    Device (BAT0)
                    {
                        Name (_HID, EisaId ("PNP0C0A"))
                        Name (_UID, 0x01)
                        Method (_PCL, 0, NotSerialized)
                        {
                            Return (\_SB)
                        }

                        Name (B0IP, Package (0x0D)
                        {
                            0x01, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0x01, 
                            0xFFFFFFFF, 
                            0x00, 
                            0x00, 
                            0x5A, 
                            0x5A, 
                            "", 
                            "100", 
                            "Lion", 
                            0x00
                        })
                        Name (B0SP, Package (0x04)
                        {
                            0x00, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (\ECON)
                            {
                                Store (NB0A, Local1)
                                If (NB0N)
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (RBEC (0x88), Local0)
                                ShiftRight (Local0, 0x00, Local1)
                                And (Local1, 0x01, Local1)
                                If (And (Local0, 0x40))
                                {
                                    Store (0x00, Local1)
                                }
                            }

                            Store (Local1, B0ST)
                            If (Local1)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_BIF, 0, NotSerialized)
                        {
                            Store (B0ST, Local6)
                            Store (0x14, Local7)
                            While (LAnd (Local6, Local7))
                            {
                                If (\ECON)
                                {
                                    Store (NB0S, Local1)
                                }
                                Else
                                {
                                    Store (RBEC (0x88), Local1)
                                }

                                If (And (Local1, 0x08))
                                {
                                    Store (0x00, Local6)
                                }
                                Else
                                {
                                    Sleep (0x01F4)
                                    Decrement (Local7)
                                }
                            }

                            Return (GBIF (0x00, B0IP, Local6))
                        }

                        Method (_BST, 0, NotSerialized)
                        {
                            XOr (DerefOf (Index (B0IP, 0x00)), 0x01, Local0)
                            If (\ECON)
                            {
                                Store (NB0S, Local1)
                            }
                            Else
                            {
                                Store (RBEC (0x88), Local1)
                            }

                            Return (GBST (0x00, Local1, Local0, B0SP))
                        }
                    }

                    Name (ACST, 0x01)
                    Device (ADP1)
                    {
                        Name (_HID, "ACPI0003")
                        Method (_PSR, 0, NotSerialized)
                        {
                            If (ECON)
                            {
                                Store (KACS, Local1)
                            }
                            Else
                            {
                                Store (RBEC (0x70), Local0)
                                And (Local0, 0x20, Local1)
                            }

                            If (Local1)
                            {
                                Store (0x01, ACST)
                            }
                            Else
                            {
                                Store (0x00, ACST)
                            }

                            Return (ACST)
                        }

                        Method (_PCL, 0, NotSerialized)
                        {
                            Return (\_SB)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0F)
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
                    Name (_CID, 0x010CD041)
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
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
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
                            0x1200,             // Range Minimum
                            0x1200,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                    })
                }

                Device (CDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x03)
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x06B0,             // Range Minimum
                            0x06B0,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x06B0,             // Range Minimum
                            0x06B0,             // Range Maximum
                            0x01,               // Alignment
                            0x50,               // Length
                            )
                    })
                    Name (BUF2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x06A0,             // Range Minimum
                            0x06A0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x06B0,             // Range Minimum
                            0x06B0,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                    })
                    Name (BUF3, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x06A0,             // Range Minimum
                            0x06A0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x06B0,             // Range Minimum
                            0x06B0,             // Range Maximum
                            0x01,               // Alignment
                            0x50,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (EMAE)
                        {
                            If (CIRP)
                            {
                                Return (BUF0)
                            }

                            Return (BUF1)
                        }
                        Else
                        {
                            If (CIRP)
                            {
                                Return (BUF2)
                            }

                            Return (BUF3)
                        }
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

                OperationRegion (N393, SystemIO, 0x2E, 0x02)
                Field (N393, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, Lock, Preserve)
                {
                            Offset (0x07), 
                    R07H,   8, 
                            Offset (0x20), 
                    R20H,   8, 
                    R21H,   8, 
                    R22H,   8, 
                    R23H,   8, 
                    R24H,   8, 
                    R25H,   8, 
                    R26H,   8, 
                    R27H,   8, 
                    R28H,   8, 
                    R29H,   8, 
                    R2AH,   8, 
                            Offset (0x30), 
                    R30H,   8, 
                            Offset (0x60), 
                    R60H,   8, 
                    R61H,   8, 
                            Offset (0x70), 
                    R70H,   8, 
                    R71H,   8, 
                            Offset (0x74), 
                    R74H,   8, 
                    R75H,   8, 
                            Offset (0xF0), 
                    RF0H,   8, 
                    RF1H,   8
                }

                Mutex (MTIO, 0x00)
                Method (SETD, 1, Serialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (0x07, INDX)
                    Store (Arg0, DATA)
                    Release (MTIO)
                }

                Method (READ, 1, Serialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (Arg0, INDX)
                    Store (DATA, Local0)
                    Return (Local0)
                    Release (MTIO)
                }

                Method (WRIT, 2, Serialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (Arg0, INDX)
                    Store (Arg1, DATA)
                    Release (MTIO)
                }

                Method (STAT, 1, NotSerialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (0x26, INDX)
                    And (DATA, Arg0, Local0)
                    Release (MTIO)
                    Return (XOr (Local0, Arg0))
                }

                Device (FIR)
                {
                    Name (_UID, 0x02)
                    Name (FLAG, 0xFF)
                    Name (ISNO, 0x00)
                    Name (ISIR, 0x01)
                    Name (ISCB, 0x02)
                    Method (MODE, 0, NotSerialized)
                    {
                        If (LEqual (FLAG, 0xFF))
                        {
                            If (STAT (0x04))
                            {
                                SETD (0x02)
                                If (LEqual (READ (0x74), 0x04))
                                {
                                    Store (ISCB, FLAG)
                                }
                                Else
                                {
                                    Store (ISIR, FLAG)
                                }
                            }
                            Else
                            {
                                Store (ISNO, FLAG)
                            }
                        }

                        Return (FLAG)
                    }

                    Method (_HID, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), ISIR))
                        {
                            Return (0x0160633A)
                        }
                        Else
                        {
                            Return (0x0105D041)
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LAnd (NATP, CMBP))
                        {
                            If (LEqual (MODE (), ISNO))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                SETD (0x02)
                                If (READ (0x30))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Return (0x00)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        SETD (0x02)
                        WRIT (0x30, 0x00)
                    }

                    Name (CRSA, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y17)
                        IRQNoFlags (_Y18)
                            {}
                    })
                    Name (CRSB, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y19)
                        IRQNoFlags (_Y1A)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y1B)
                            {}
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.FIR._Y17._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.FIR._Y17._MAX, MAXA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.FIR._Y18._INT, INTA)
                        Store (Zero, MINA)
                        Store (Zero, MAXA)
                        Store (Zero, INTA)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.FIR._Y19._MIN, MINB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.FIR._Y19._MAX, MAXB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.FIR._Y1A._INT, INTB)
                        CreateByteField (CRSB, \_SB.PCI0.LPCB.FIR._Y1B._DMA, DMAB)
                        Store (Zero, MINB)
                        Store (Zero, MAXB)
                        Store (Zero, INTB)
                        Store (Zero, DMAB)
                        SETD (0x02)
                        If (READ (0x30))
                        {
                            ShiftLeft (READ (0x60), 0x08, Local0)
                            Add (Local0, READ (0x61), Local0)
                            Store (Local0, MINA)
                            Store (Local0, MAXA)
                            Store (Local0, MINB)
                            Store (Local0, MAXB)
                            And (READ (0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, Local0)
                            }

                            Store (Local0, INTA)
                            Store (Local0, INTB)
                            Store (READ (0x74), Local0)
                            If (LNotEqual (Local0, 0x04))
                            {
                                ShiftLeft (One, Local0, DMAB)
                            }
                        }

                        If (LEqual (MODE (), ISIR))
                        {
                            Return (CRSB)
                        }
                        Else
                        {
                            Return (CRSA)
                        }
                    }

                    Name (PRSA, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        EndDependentFn ()
                    })
                    Name (PRSB, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        EndDependentFn ()
                    })
                    Method (_PRS, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), ISIR))
                        {
                            Return (PRSB)
                        }
                        Else
                        {
                            Return (PRSA)
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        If (LEqual (MODE (), ISIR))
                        {
                            Store (Arg0, CRSB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.FIR._Y19._MIN, MINB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.FIR._Y1A._INT, INTB)
                            CreateByteField (CRSB, \_SB.PCI0.LPCB.FIR._Y1B._DMA, DMAB)
                            FindSetRightBit (DMAB, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                            }
                            Else
                            {
                                Store (0x04, Local0)
                            }

                            Store (MINB, Local1)
                            Store (INTB, Local2)
                        }
                        Else
                        {
                            Store (Arg0, CRSA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.FIR._Y17._MIN, MINA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.FIR._Y18._INT, INTA)
                            Store (0x04, Local0)
                            Store (MINA, Local1)
                            Store (INTA, Local2)
                        }

                        SETD (0x02)
                        WRIT (0x74, Local0)
                        WRIT (0x61, IOLO)
                        WRIT (0x60, IOHI)
                        FindSetRightBit (Local2, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        WRIT (0x70, Local0)
                        And (LDE0, 0x8F, LDE0)
                        If (LEqual (IOHI, 0x03))
                        {
                            If (LEqual (IOLO, 0xF8))
                            {
                                Or (LDE0, 0x00, LDE0)
                            }
                            Else
                            {
                                Or (LDE0, 0x70, LDE0)
                            }
                        }
                        Else
                        {
                            If (LEqual (IOLO, 0xF8))
                            {
                                Or (LDE0, 0x10, LDE0)
                            }
                            Else
                            {
                                Or (LDE0, 0x50, LDE0)
                            }
                        }

                        WRIT (0x30, 0x01)
                        If (LEqual (MODE (), ISIR))
                        {
                            Or (READ (0xF0), 0x80, Local0)
                            WRIT (0xF0, Local0)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        SETD (0x02)
                        If (LEqual (MODE (), ISIR))
                        {
                            Or (READ (0xF0), 0x80, Local1)
                            WRIT (0xF0, Local1)
                        }

                        WRIT (0x30, 0x01)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        SETD (0x02)
                        WRIT (0x30, 0x00)
                    }
                }

                Device (COMA)
                {
                    Name (_HID, EisaId ("PNP0501"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LAnd (NATP, CMAP))
                        {
                            SETD (0x03)
                            If (READ (0x30))
                            {
                                Return (0x0F)
                            }

                            Return (0x0D)
                        }

                        Return (0x00)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        SETD (0x03)
                        WRIT (0x30, 0x00)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y1C)
                            IRQNoFlags (_Y1D)
                                {4}
                        })
                        SETD (0x03)
                        If (CMAP)
                        {
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.COMA._CRS._Y1C._MIN, IOL0)
                            CreateByteField (BUF0, 0x03, IOH0)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.COMA._CRS._Y1C._MAX, IOL1)
                            CreateByteField (BUF0, 0x05, IOH1)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.COMA._CRS._Y1C._LEN, LEN0)
                            CreateWordField (BUF0, \_SB.PCI0.LPCB.COMA._CRS._Y1D._INT, IRQW)
                            Store (READ (0x60), IOH0)
                            Store (READ (0x61), IOL0)
                            Store (READ (0x60), IOH1)
                            Store (READ (0x61), IOL1)
                            Store (0x08, LEN0)
                            And (READ (0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, IRQW)
                            }
                            Else
                            {
                                Store (Zero, IRQW)
                            }
                        }

                        Return (BUF0)
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            EndDependentFn ()
                        })
                        Return (BUF0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x09, IRQW)
                        SETD (0x03)
                        WRIT (0x30, 0x00)
                        WRIT (0x61, IOLO)
                        WRIT (0x60, IOHI)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            Decrement (Local0)
                        }

                        WRIT (0x70, Local0)
                        And (LDE0, 0xF8, LDE0)
                        If (LEqual (IOHI, 0x03))
                        {
                            If (LEqual (IOLO, 0xF8))
                            {
                                Or (LDE0, 0x00, LDE0)
                            }
                            Else
                            {
                                Or (LDE0, 0x07, LDE0)
                            }
                        }
                        Else
                        {
                            If (LEqual (IOLO, 0xF8))
                            {
                                Or (LDE0, 0x01, LDE0)
                            }
                            Else
                            {
                                Or (LDE0, 0x05, LDE0)
                            }
                        }

                        WRIT (0x30, 0x01)
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        SETD (0x03)
                        WRIT (0x30, 0x01)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        SETD (0x03)
                        WRIT (0x30, 0x00)
                    }
                }

                Device (POUT)
                {
                    Name (_HID, EisaId ("PNP0400"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        If (LEqual (LPTM, 0x00))
                        {
                            If (LAnd (NATP, LPTP))
                            {
                                If (LPTA)
                                {
                                    Return (0x0F)
                                }

                                Return (0x0D)
                            }
                        }

                        Return (0x00)
                        Release (MTIO)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        If (LEqual (LPTM, 0x00))
                        {
                            Store (0x00, R30H)
                        }

                        Release (MTIO)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y1E)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y1F)
                            IRQNoFlags (_Y20)
                                {}
                        })
                        Store (0x01, R07H)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.POUT._CRS._Y1E._MIN, IOL0)
                        CreateByteField (BUF0, 0x03, IOH0)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.POUT._CRS._Y1E._MAX, IOL1)
                        CreateByteField (BUF0, 0x05, IOH1)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.POUT._CRS._Y1E._ALN, ALB1)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.POUT._CRS._Y1E._LEN, LEN0)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.POUT._CRS._Y1F._MIN, IOL2)
                        CreateByteField (BUF0, 0x0B, IOH2)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.POUT._CRS._Y1F._MAX, IOL3)
                        CreateByteField (BUF0, 0x0D, IOH3)
                        CreateWordField (BUF0, \_SB.PCI0.LPCB.POUT._CRS._Y20._INT, IRQW)
                        If (LPTA)
                        {
                            Store (R61H, IOL0)
                            Store (R60H, IOH0)
                            Store (IOL0, IOL1)
                            Store (IOH0, IOH1)
                            Store (IOL0, IOL2)
                            Add (IOH0, 0x04, IOH2)
                            Store (IOL0, IOL3)
                            Add (IOH0, 0x04, IOH3)
                            If (LEqual (IOL0, 0xBC))
                            {
                                Store (0x08, ALB1)
                                Store (0x04, LEN0)
                            }

                            Store (0x01, Local0)
                            ShiftLeft (Local0, R70H, IRQW)
                        }

                        Return (BUF0)
                        Release (MTIO)
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
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {5}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        CreateByteField (Arg0, 0x02, IOB1)
                        CreateByteField (Arg0, 0x03, IOB2)
                        CreateByteField (Arg0, 0x04, IOB3)
                        CreateByteField (Arg0, 0x05, IOB4)
                        CreateByteField (Arg0, 0x06, ALB1)
                        CreateByteField (Arg0, 0x07, LNB1)
                        CreateByteField (Arg0, 0x0A, IOB5)
                        CreateByteField (Arg0, 0x0B, IOB6)
                        CreateByteField (Arg0, 0x0C, IOB7)
                        CreateByteField (Arg0, 0x0D, IOB8)
                        CreateByteField (Arg0, 0x0E, ALB2)
                        CreateByteField (Arg0, 0x0F, LNB2)
                        CreateWordField (Arg0, 0x11, IRQW)
                        Store (0x01, R07H)
                        Store (0x01, R30H)
                        Store (0x01, LPTA)
                        Store (IOB1, R61H)
                        Store (IOB2, R60H)
                        FindSetRightBit (IRQW, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            Subtract (Local0, 0x01, R70H)
                        }

                        And (RF0H, 0x1F, Local0)
                        Or (Local0, 0x00, Local0)
                        Store (Local0, RF0H)
                        Store (0x00, LPTM)
                        Release (MTIO)
                    }
                }

                Device (PBID)
                {
                    Name (_HID, EisaId ("PNP0400"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        If (LEqual (LPTM, 0x01))
                        {
                            If (LAnd (NATP, LPTP))
                            {
                                If (LPTA)
                                {
                                    Return (0x0F)
                                }

                                Return (0x0D)
                            }
                        }

                        Return (0x00)
                        Release (MTIO)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        If (LEqual (LPTM, 0x01))
                        {
                            Store (0x00, R30H)
                        }

                        Release (MTIO)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y21)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y22)
                            IRQNoFlags (_Y23)
                                {}
                        })
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PBID._CRS._Y21._MIN, IOL0)
                        CreateByteField (BUF0, 0x03, IOH0)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PBID._CRS._Y21._MAX, IOL1)
                        CreateByteField (BUF0, 0x05, IOH1)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PBID._CRS._Y21._LEN, LEN0)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PBID._CRS._Y22._MIN, IOB5)
                        CreateByteField (BUF0, 0x0B, IOB6)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PBID._CRS._Y22._MAX, IOB7)
                        CreateByteField (BUF0, 0x0D, IOB8)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PBID._CRS._Y22._LEN, LNB2)
                        CreateWordField (BUF0, \_SB.PCI0.LPCB.PBID._CRS._Y23._INT, IRQB)
                        Store (0x01, R07H)
                        If (LPTA)
                        {
                            Store (R61H, IOL0)
                            Store (R60H, IOH0)
                            Store (IOL0, IOL1)
                            Store (IOH0, IOH1)
                            Store (IOL0, IOB5)
                            Add (IOH0, 0x04, IOB6)
                            Store (IOL0, IOB7)
                            Add (IOH0, 0x04, IOB8)
                            If (LEqual (IOL0, 0xBC))
                            {
                                Store (0x04, LEN0)
                            }

                            Store (0x01, Local0)
                            ShiftLeft (Local0, R70H, IRQB)
                        }

                        Return (BUF0)
                        Release (MTIO)
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
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {5}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        CreateByteField (Arg0, 0x02, IOL0)
                        CreateByteField (Arg0, 0x03, IOH0)
                        CreateByteField (Arg0, 0x04, IOB3)
                        CreateByteField (Arg0, 0x05, IOB4)
                        CreateByteField (Arg0, 0x06, ALB1)
                        CreateByteField (Arg0, 0x07, LNB1)
                        CreateByteField (Arg0, 0x0A, IOB5)
                        CreateByteField (Arg0, 0x0B, IOB6)
                        CreateByteField (Arg0, 0x0C, IOB7)
                        CreateByteField (Arg0, 0x0D, IOB8)
                        CreateByteField (Arg0, 0x0E, ALB2)
                        CreateByteField (Arg0, 0x0F, LNB2)
                        CreateWordField (Arg0, 0x11, IRQB)
                        Store (0x01, R07H)
                        Store (0x01, R30H)
                        Store (0x01, LPTA)
                        Store (IOL0, R61H)
                        Store (IOH0, R60H)
                        FindSetLeftBit (IRQB, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            Subtract (Local0, 0x01, R70H)
                        }

                        Or (And (RF0H, 0x1F), 0x20, RF0H)
                        Store (0x01, LPTM)
                        Release (MTIO)
                    }
                }

                Device (PEPP)
                {
                    Name (_HID, EisaId ("PNP0400"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        If (LEqual (LPTM, 0x02))
                        {
                            If (LAnd (NATP, LPTP))
                            {
                                If (LPTA)
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Return (0x00)
                        Release (MTIO)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        If (LEqual (LPTM, 0x02))
                        {
                            Store (0x00, R30H)
                        }

                        Release (MTIO)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y24)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y25)
                            IRQNoFlags (_Y26)
                                {}
                        })
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PEPP._CRS._Y24._MIN, IOL0)
                        CreateByteField (BUF0, 0x03, IOH0)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PEPP._CRS._Y24._MAX, IOL1)
                        CreateByteField (BUF0, 0x05, IOH1)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PEPP._CRS._Y24._LEN, LEN0)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PEPP._CRS._Y25._MIN, IOB5)
                        CreateByteField (BUF0, 0x0B, IOB6)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PEPP._CRS._Y25._MAX, IOB7)
                        CreateByteField (BUF0, 0x0D, IOB8)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PEPP._CRS._Y25._ALN, ALB2)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PEPP._CRS._Y25._LEN, LNB2)
                        CreateWordField (BUF0, \_SB.PCI0.LPCB.PEPP._CRS._Y26._INT, IRQB)
                        Store (0x01, R07H)
                        If (LEqual (And (RF0H, 0xE0), 0x60))
                        {
                            Store (R61H, IOL0)
                            Store (R60H, IOH0)
                            Store (IOL0, IOL1)
                            Store (IOH0, IOH1)
                            Store (IOL0, IOB5)
                            Add (IOH0, 0x04, IOB6)
                            Store (IOL0, IOB7)
                            Add (IOH0, 0x04, IOB8)
                            Store (0x01, Local0)
                            ShiftLeft (Local0, R70H, IRQB)
                        }

                        Return (BUF0)
                        Release (MTIO)
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
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0178,             // Range Minimum
                                0x0178,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0578,             // Range Minimum
                                0x0578,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
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
                            IO (Decode16,
                                0x0578,             // Range Minimum
                                0x0578,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQ (Edge, ActiveHigh, Exclusive, )
                                {5}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        CreateByteField (Arg0, 0x02, IOL0)
                        CreateByteField (Arg0, 0x03, IOH0)
                        CreateByteField (Arg0, 0x04, IOB3)
                        CreateByteField (Arg0, 0x05, IOB4)
                        CreateByteField (Arg0, 0x06, ALB1)
                        CreateByteField (Arg0, 0x07, LNB1)
                        CreateByteField (Arg0, 0x0A, IOB5)
                        CreateByteField (Arg0, 0x0B, IOB6)
                        CreateByteField (Arg0, 0x0C, IOB7)
                        CreateByteField (Arg0, 0x0D, IOB8)
                        CreateByteField (Arg0, 0x0E, ALB2)
                        CreateByteField (Arg0, 0x0F, LNB2)
                        CreateWordField (Arg0, 0x11, IRQB)
                        Store (0x01, R07H)
                        Store (0x01, R30H)
                        Store (0x01, LPTA)
                        Store (IOL0, R61H)
                        Store (IOH0, R60H)
                        FindSetLeftBit (IRQB, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            Subtract (Local0, 0x01, R70H)
                        }

                        Or (And (RF0H, 0x1F), 0x60, RF0H)
                        Store (0x02, LPTM)
                        Release (MTIO)
                    }
                }

                Device (PECP)
                {
                    Name (_HID, EisaId ("PNP0401"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        If (LEqual (LPTM, 0x03))
                        {
                            If (LAnd (NATP, LPTP))
                            {
                                If (LPTA)
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Return (0x00)
                        Release (MTIO)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x01, R07H)
                        Acquire (MTIO, 0xFFFF)
                        If (LEqual (LPTM, 0x03))
                        {
                            Store (0x00, R30H)
                            Store (0x00, R74H)
                        }

                        Release (MTIO)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Acquire (MTIO, 0xFFFF)
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y27)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y28)
                            IRQNoFlags (_Y29)
                                {}
                            DMA (Compatibility, NotBusMaster, Transfer16, _Y2A)
                                {}
                        })
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PECP._CRS._Y27._MIN, IOL0)
                        CreateByteField (BUF0, 0x03, IOH0)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PECP._CRS._Y27._MAX, IOL1)
                        CreateByteField (BUF0, 0x05, IOH1)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PECP._CRS._Y27._LEN, LEN0)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PECP._CRS._Y28._MIN, IOL2)
                        CreateByteField (BUF0, 0x0B, IOH2)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PECP._CRS._Y28._MAX, IOL3)
                        CreateByteField (BUF0, 0x0D, IOH3)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PECP._CRS._Y28._LEN, LEN1)
                        CreateWordField (BUF0, \_SB.PCI0.LPCB.PECP._CRS._Y29._INT, IRQW)
                        CreateByteField (BUF0, \_SB.PCI0.LPCB.PECP._CRS._Y2A._DMA, DMA0)
                        Store (0x01, R07H)
                        If (LPTA)
                        {
                            Store (R61H, IOL0)
                            Store (R60H, IOH0)
                            Store (IOL0, IOL1)
                            Store (IOH0, IOH1)
                            Store (IOL0, IOL2)
                            Store (Add (0x04, IOH0), IOH2)
                            Store (IOL0, IOL3)
                            Store (Add (0x04, IOH0), IOH3)
                            If (LEqual (IOL0, 0xBC))
                            {
                                Store (0x04, LEN0)
                            }

                            Store (0x01, Local0)
                            ShiftLeft (Local0, R70H, IRQW)
                            Store (0x01, Local0)
                            ShiftLeft (Local0, R74H, DMA0)
                            Store (R74H, Local0)
                        }

                        Return (BUF0)
                        Release (MTIO)
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
                                0x04,               // Length
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
                                0x04,               // Length
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
                        Acquire (MTIO, 0xFFFF)
                        CreateByteField (Arg0, 0x02, IOL0)
                        CreateByteField (Arg0, 0x03, IOH0)
                        CreateWordField (Arg0, 0x11, IRQW)
                        CreateByteField (Arg0, 0x14, DMA0)
                        Store (0x01, R07H)
                        Store (0x01, R30H)
                        Store (0x01, LPTA)
                        Store (IOL0, R61H)
                        Store (IOH0, R60H)
                        FindSetLeftBit (IRQW, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            Subtract (Local0, 0x01, R70H)
                        }

                        FindSetLeftBit (DMA0, Local0)
                        Subtract (Local0, 0x01, R74H)
                        And (RF0H, 0x1F, Local0)
                        Or (Local0, 0xF0, Local0)
                        Store (Local0, RF0H)
                        Store (0x03, LPTM)
                        Release (MTIO)
                    }
                }

                Device (KBD0)
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
                    Method (_HID, 0, NotSerialized)
                    {
                        If (\ECON)
                        {
                            Store (\_SB.PCI0.LPCB.EC0.PLB1, Local0)
                        }
                        Else
                        {
                            And (\RBEC (0x12), 0x02, Local0)
                        }

                        If (Local0)
                        {
                            Return (0x09032E4F)
                        }
                        Else
                        {
                            Return (0x01032E4F)
                        }
                    }

                    Name (_CID, Package (0x03)
                    {
                        0x00032E4F, 
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
                            And (PRIT, 0xC0F0, PRIT)
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
                            And (PRIT, 0xBF0F, PRIT)
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

                Method (SWRW, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    And (Arg2, 0xFF, DAT0)
                    And (ShiftRight (Arg2, 0x08), 0xFF, DAT1)
                    Store (0x4C, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRDW, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x4C, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (Or (ShiftLeft (DAT1, 0x08), DAT0))
                    }

                    Return (0xFFFFFFFF)
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

