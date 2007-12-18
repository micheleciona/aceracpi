/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 5315, Tue Dec 18 17:31:26 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000084E4 (34020)
 *     Revision         0x01
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x00000001 (1)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x01000013 (16777235)
 */
DefinitionBlock ("5315.aml", "DSDT", 1, "ACRSYS", "ACRPRDCT", 0x00000001)
{
    OperationRegion (PORT, SystemIO, 0x80, 0x01)
    Field (PORT, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
    }

    OperationRegion (GPIO, SystemIO, 0x0500, 0x3B)
    Field (GPIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x0C), 
            ,   1, 
        CRTS,   1, 
                Offset (0x2C), 
            ,   1, 
        GPE1,   1, 
            ,   9, 
        LPDL,   1, 
                Offset (0x38), 
            ,   1, 
            ,   1, 
        CPEN,   1
    }

    OperationRegion (PMBA, SystemIO, 0x0400, 0x80)
    Field (PMBA, ByteAcc, NoLock, Preserve)
    {
                Offset (0x28), 
            ,   2, 
        SPST,   1, 
                Offset (0x42), 
            ,   1, 
        GPEC,   1, 
                Offset (0x64), 
            ,   9, 
        SCIS,   1, 
                Offset (0x66)
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
                Offset (0x341A), 
        RP1D,   1, 
        RP2D,   1, 
        RP3D,   1, 
        RP4D,   1, 
        RP5D,   1, 
        RP6D,   1
    }

    OperationRegion (MBOX, SystemMemory, 0x1F6BCD90, 0x000000F8)
    Field (MBOX, AnyAcc, NoLock, Preserve)
    {
        PCI1,   8, 
        PCI2,   8, 
        PCI3,   8, 
        PCI4,   8, 
        PCI5,   8, 
        PCI6,   8, 
        PCI7,   8, 
        PCI8,   8, 
        NLCK,   8, 
        ZIPE,   8, 
        COMA,   8, 
        CAIO,   8, 
        CAIP,   8, 
        CAMD,   8, 
        CADA,   8, 
        COMB,   8, 
        CBIO,   8, 
        CBIP,   8, 
        CBMD,   8, 
        CBDA,   8, 
        LPT1,   8, 
        L1IO,   8, 
        L1IP,   8, 
        L1MD,   8, 
        L1DA,   8, 
        FDDC,   8, 
        FDWP,   8, 
        AZLA,   8, 
        LANE,   8, 
        IDEC,   8, 
        PACT,   8, 
        SCFG,   8, 
        AIBT,   8, 
        AMOD,   8, 
        P0HP,   8, 
        P2HP,   8, 
        P0IL,   8, 
        P2IL,   8, 
        IDLY,   8, 
        PMTP,   8, 
        PMIO,   8, 
        PMBM,   8, 
        PMTM,   8, 
        PSTP,   8, 
        PSIO,   8, 
        PSBM,   8, 
        PSTM,   8, 
        IDE0,   8, 
        IDE1,   8, 
        IDE2,   8, 
        IDE3,   8, 
        IDE4,   8, 
        IDE5,   8, 
        IDE6,   8, 
        IDE7,   8, 
        PEGS,   8, 
        IGMT,   8, 
        CLKC,   8, 
        CKSC,   8, 
        ASLB,   32, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        LUBS,   8, 
        U201,   8, 
        U202,   8, 
        U111,   8, 
        U112,   8, 
        U113,   8, 
        U114,   8, 
        U115,   8, 
        UPPC,   8, 
        UP00,   8, 
        UP01,   8, 
        UP02,   8, 
        UP03,   8, 
        UP04,   8, 
        UP05,   8, 
        UP06,   8, 
        UP07,   8, 
        UP08,   8, 
        UP09,   8, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IDMM,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        GSMI,   8, 
        PLYT,   8, 
        EDCG,   8, 
        SDFY,   8, 
        SDTC,   8, 
        SDRP,   8, 
        SDCL,   8, 
        SDRC,   8, 
        SDRE,   8, 
        FC2L,   8, 
        FC3L,   8, 
        FCS4,   8, 
        APIM,   8, 
        HPTS,   8, 
        HPTA,   8, 
        EMAS,   8, 
        MASF,   8, 
        ASFB,   8, 
        MBTX,   8, 
        XPRO,   8, 
        IDER,   8, 
        SOLE,   8, 
        EYLS,   8, 
        EYLH,   8, 
        TPMD,   8, 
        TPMO,   8, 
        TPMC,   8, 
        ISTC,   8, 
        TRML,   8, 
        FNON,   8, 
        TRON,   8, 
        NXMD,   8, 
        PCRR,   8, 
        C4EN,   8, 
        C43D,   8, 
        EMTT,   8, 
        PROH,   8, 
        DFSB,   8, 
        TUBM,   8, 
        TSEN,   8, 
        BPST,   8, 
        DAS1,   8, 
        DAS3,   8, 
        WKPM,   8, 
        WKMD,   8, 
        WKS5,   8, 
        HOUR,   8, 
        MINS,   8, 
        SECS,   8, 
        DOFM,   8, 
        QKS4,   8, 
        CAPM,   8, 
        POPU,   8, 
        POPD,   8, 
        NXFE,   8, 
        VTST,   8, 
        VTFE,   8, 
        S5FG,   8, 
        CSTS,   8, 
        ENCS,   8, 
        DEC4,   8, 
        HC4E,   8, 
        CSTR,   8, 
        CMPE,   8, 
        CSMD,   8, 
        DTSE,   8, 
        DTSC,   8, 
        QBOT,   8, 
        QEBT,   8, 
        PBOT,   8, 
        RAID,   8, 
        OSYS,   16
    }

    OperationRegion (CMS1, SystemIO, 0x72, 0x02)
    Field (CMS1, ByteAcc, NoLock, Preserve)
    {
        CMSI,   8, 
        CMSD,   8
    }

    Method (CMSW, 2, NotSerialized)
    {
        Store (Arg0, CMSI)
        Store (Arg1, CMSD)
    }

    OperationRegion (SMIO, SystemIO, 0xB2, 0x02)
    Field (SMIO, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    Method (OSMI, 1, NotSerialized)
    {
        Store (Arg0, APMD)
        Store (0xB2, APMC)
        Stall (0xFF)
        Stall (0xFF)
        Stall (0xFF)
        Stall (0xFF)
        Stall (0xFF)
        Stall (0xFF)
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
                Offset (0x02), 
                Offset (0x04), 
                Offset (0x06), 
                Offset (0x08), 
        TRP0,   8, 
                Offset (0x0A), 
                Offset (0x0B), 
                Offset (0x0C), 
                Offset (0x0D), 
                Offset (0x0E), 
                Offset (0x0F), 
                Offset (0x10)
    }

    OperationRegion (IO_D, SystemIO, 0x0810, 0x08)
    Field (IO_D, ByteAcc, NoLock, Preserve)
    {
        TRPD,   8
    }

    OperationRegion (NVST, SystemMemory, 0x1F6BCE88, 0x00000062)
    Field (NVST, AnyAcc, Lock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        LCDA,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        CMPF,   8, 
        CSTF,   8, 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        PPMF,   32, 
        TSTE,   8, 
        KBTP,   8, 
        MIRT,   8, 
        OTHR,   8, 
        DI00,   320
    }

    Mutex (PSMX, 0x00)
    Method (IHWM, 2, NotSerialized)
    {
        Acquire (PSMX, 0xFFFF)
        Store (Arg0, PRM0)
        Store (Arg1, DI00)
        Store (0x60, APMC)
        Store (DI00, Local0)
        Release (PSMX)
        Return (Local0)
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x01, 0x00000410, 0x06) {}
        Processor (CPU1, 0x02, 0x00000410, 0x06) {}
    }

    Name (ECON, 0x00)
    Name (CTYP, 0x00)
    Name (DSEN, 0x01)
    Name (SYSF, 0x00)
    Method (_PTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x01))
        {
            Store (0x51, P80H)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x53, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x54, P80H)
            OSMI (0x82)
            CMSW (0x3F, 0x3F)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x01, SYSF)
        }

        Return (0x00)
    }

    Method (_WAK, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x01))
        {
            Store (0xE1, P80H)
        }

        If (LEqual (Arg0, 0x03))
        {
            If (DTSE)
            {
                Store (0x14, DTSF)
                Store (0x00, TRPD)
            }

            OSMI (0x81)
            Store (0xE3, P80H)
        }

        If (LEqual (Arg0, 0x04)) {}
        Return (0x00)
    }

    Name (\_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x04)
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)
    {
        0x06, 
        0x06, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)
    {
        0x07, 
        0x07, 
        0x00, 
        0x00
    })
    Scope (_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Sleep (0x64)
            If (LAnd (LEqual (RP1D, 0x00), \_SB.PCI0.EXP1.HPCS))
            {
                Sleep (0x05DC)
                If (\_SB.PCI0.EXP1.PDC1)
                {
                    Store (0x01, \_SB.PCI0.EXP1.PDC1)
                    Store (0x01, \_SB.PCI0.EXP1.HPCS)
                    Notify (\_SB.PCI0.EXP1, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.EXP1.HPCS)
                }
            }

            If (LAnd (LEqual (RP2D, 0x00), \_SB.PCI0.EXP2.HPCS))
            {
                If (\_SB.PCI0.EXP2.PDC2)
                {
                    Store (0x01, \_SB.PCI0.EXP2.PDC2)
                    Store (0x01, \_SB.PCI0.EXP2.HPCS)
                    Notify (\_SB.PCI0.EXP2, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.EXP2.HPCS)
                }
            }

            If (LAnd (LEqual (RP3D, 0x00), \_SB.PCI0.EXP3.HPCS))
            {
                If (\_SB.PCI0.EXP3.PDC3)
                {
                    Store (0x01, \_SB.PCI0.EXP3.PDC3)
                    Store (0x01, \_SB.PCI0.EXP3.HPCS)
                    Notify (\_SB.PCI0.EXP3, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.EXP3.HPCS)
                }
            }
        }

        Method (_L02, 0, NotSerialized)
        {
            Store (0x00, GPEC)
            Notify (\_TZ.TZ01, 0x80)
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC1, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC2, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC5, 0x02)
        }

        Method (_L06, 0, NotSerialized)
        {
            If (\_SB.PCI0.OVGA.GSSE)
            {
                \_SB.PCI0.OVGA.GSCI ()
            }
            Else
            {
                Store (0x01, SCIS)
            }
        }

        Method (_L09, 0, NotSerialized)
        {
            Store (One, \_SB.PCI0.EXP3.PSP3)
            Store (One, \_SB.PCI0.EXP3.PMCS)
            Notify (\_SB.PCI0.EXP3, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P32, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC3, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            If (\_SB.PCI0.EHC1.PMES)
            {
                Store (0x01, \_SB.PCI0.EHC1.PMES)
                Notify (\_SB.PCI0.EHC1, 0x02)
            }

            If (\_SB.PCI0.EHC2.PMES)
            {
                Store (0x01, \_SB.PCI0.EHC2.PMES)
                Notify (\_SB.PCI0.EHC2, 0x02)
            }

            If (\_SB.PCI0.AZAL.PMES)
            {
                Store (One, \_SB.PCI0.AZAL.PMES)
                Notify (\_SB.PCI0.AZAL, 0x02)
            }
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC4, 0x02)
        }

        Method (_L11, 0, NotSerialized)
        {
            If (LEqual (\_SB.PCI0.WMID.BGEF, 0x01))
            {
                If (LEqual (CRTS, 0x01))
                {
                    Store (\_SB.PCI0.WMID.VAPI, Local0)
                    Store (0x01, GPE1)
                }
                Else
                {
                    Store (\_SB.PCI0.WMID.VAPO, Local0)
                    Store (0x00, GPE1)
                }

                Store (Local0, \_SB.PCI0.WMID.NTDV)
                Notify (\_SB.PCI0.WMID, 0x82)
            }
        }

        Method (_L1B, 0, NotSerialized)
        {
            If (LEqual (SYSF, 0x00))
            {
                Not (LPDL, LPDL)
                Notify (\_SB.PCI0.LPC.LID0, 0x80)
            }
        }

        Method (_E1C, 0, NotSerialized)
        {
        }
    }

    Name (\GPIC, Zero)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, \GPIC)
    }

    Scope (_TZ)
    {
        ThermalZone (TZ01)
        {
            Method (_CRT, 0, Serialized)
            {
                Return (Add (0x0AAC, Multiply (0x64, 0x0A)))
            }

            Method (_TMP, 0, Serialized)
            {
                If (ECON)
                {
                    If (DTSE)
                    {
                        Store (DTS2, Local1)
                        If (LGreaterEqual (DTS1, DTS2))
                        {
                            Store (DTS1, Local1)
                        }

                        Store (Local1, \_SB.PCI0.LPC.EC0.SKTA)
                        Return (Add (0x0AAC, Multiply (Local1, 0x0A)))
                    }
                }

                Return (0x0BB8)
            }
        }
    }

    Method (SCMP, 2, NotSerialized)
    {
        Name (STG1, Buffer (0x50) {})
        Name (STG2, Buffer (0x50) {})
        Store (Arg0, STG1)
        Store (Arg1, STG2)
        If (LNotEqual (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Store (Zero, Local0)
        While (LLess (Local0, SizeOf (Arg0)))
        {
            If (LNotEqual (DerefOf (Index (STG1, Local0)), DerefOf (Index (
                STG2, Local0))))
            {
                Return (Zero)
            }

            Increment (Local0)
        }

        Return (One)
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
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_ADR, 0x00)
            Method (_INI, 0, NotSerialized)
            {
                Store (0x00, SYSF)
                If (CondRefOf (_OSI, Local0))
                {
                    If (_OSI ("Linux"))
                    {
                        Store (0x03E8, OSYS)
                    }

                    If (_OSI ("Windows 2006"))
                    {
                        Store (0x07D6, OSYS)
                    }
                    Else
                    {
                        Store (0x07D1, OSYS)
                    }
                }
                Else
                {
                    Store (0x07D0, OSYS)
                }

                If (DTSE)
                {
                    Store (0x1D, P80H)
                    Store (0x14, DTSF)
                    Store (0x00, TRPD)
                    Store (0x1F, P80H)
                }
            }

            Method (_OSC, 5, NotSerialized)
            {
                Store (Arg3, Local0)
                Multiply (Local0, 0x04, Local1)
                Name (BUF1, Buffer (Local1) {})
                Store (Arg4, BUF1)
                Store (0x00, Local1)
                Store (0x00, Local2)
                While (Local0)
                {
                    Multiply (Local1, 0x04, Local2)
                    CreateDWordField (BUF1, Local2, CAPB)
                    If (Arg2)
                    {
                        If (LEqual (Local1, 0x00))
                        {
                            And (CAPB, 0xFFFFFFFC)
                        }
                    }
                    Else
                    {
                    }

                    Increment (Local1)
                    Decrement (Local0)
                }

                Return (BUF1)
            }

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
                        Offset (0x62), 
                TUUD,   16, 
                        Offset (0x70), 
                    ,   4, 
                TLUD,   12
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    0x00,, , TypeStatic)
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
                    0x00,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
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
                ShiftLeft (TLUD, 0x14, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (LEqual (\GPIC, Zero))
                {
                    Return (Package (0x12)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x00, 
                            \_SB.PCI0.LPC.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x01, 
                            \_SB.PCI0.LPC.LNKF, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            \_SB.PCI0.LPC.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            \_SB.PCI0.LPC.LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            \_SB.PCI0.LPC.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            \_SB.PCI0.LPC.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            \_SB.PCI0.LPC.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            \_SB.PCI0.LPC.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            \_SB.PCI0.LPC.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            \_SB.PCI0.LPC.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            \_SB.PCI0.LPC.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            \_SB.PCI0.LPC.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            \_SB.PCI0.LPC.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            \_SB.PCI0.LPC.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            \_SB.PCI0.LPC.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            \_SB.PCI0.LPC.LNKA, 
                            0x00
                        }
                    })
                }
                Else
                {
                    Return (Package (0x12)
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
                            0x001AFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x01, 
                            0x00, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            0x00, 
                            0x12
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
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            0x00, 
                            0x11
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
                            0x17
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
                            0x02, 
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
            }

            Device (P32)
            {
                Name (_ADR, 0x001E0000)
                Device (R394)
                {
                    Name (_ADR, 0x00)
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (\GPIC, Zero))
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC.LNKG, 
                                0x00
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x16
                            }
                        })
                    }
                }
            }

            Device (LPC)
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
                    CMA0,   1, 
                    CMB0,   1, 
                    LP0E,   1, 
                    FDDE,   1, 
                            Offset (0x44), 
                    DIO1,   16, 
                    RIO1,   8, 
                            Offset (0x60), 
                        ,   7, 
                    C4O3,   1
                }

                OperationRegion (PRR0, PCI_Config, 0x60, 0x04)
                Field (PRR0, AnyAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8
                }

                OperationRegion (PRR1, PCI_Config, 0x68, 0x04)
                Field (PRR1, AnyAcc, NoLock, Preserve)
                {
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                OperationRegion (PRR2, PCI_Config, 0x80, 0x02)
                Field (PRR2, AnyAcc, NoLock, Preserve)
                {
                    IODL,   8, 
                    IODH,   8
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRA, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRA, 0x80, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0E)
                                {0}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.LPC.LNKA._CRS._Y0E._INT, IRQW)
                        If (And (PIRA, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRA, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRA)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRB, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRB, 0x80, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0F)
                                {0}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.LPC.LNKB._CRS._Y0F._INT, IRQW)
                        If (And (PIRB, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRB, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRB)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRC, 0x80, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y10)
                                {0}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.LPC.LNKC._CRS._Y10._INT, IRQW)
                        If (And (PIRC, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRC, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRC)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRD, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRD, 0x80, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y11)
                                {0}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.LPC.LNKD._CRS._Y11._INT, IRQW)
                        If (And (PIRD, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRD, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRD)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRE, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRE, 0x80, PIRE)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y12)
                                {0}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.LPC.LNKE._CRS._Y12._INT, IRQW)
                        If (And (PIRE, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRE, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRE)
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRF, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRF, 0x80, PIRF)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y13)
                                {0}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.LPC.LNKF._CRS._Y13._INT, IRQW)
                        If (And (PIRF, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRF, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRF)
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRG, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRG, 0x80, PIRG)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y14)
                                {0}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.LPC.LNKG._CRS._Y14._INT, IRQW)
                        If (And (PIRG, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRG, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRG)
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRH, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRH, 0x80, PIRH)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y15)
                                {0}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.LPC.LNKH._CRS._Y15._INT, IRQW)
                        If (And (PIRH, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRH, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRH)
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D6))
                        {
                            If (And (OTHR, 0x02))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
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
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x006C,             // Range Minimum
                            0x006C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x164E,             // Range Minimum
                            0x164E,             // Range Maximum
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
                            0x0600,             // Range Minimum
                            0x0600,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0610,             // Range Minimum
                            0x0610,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0810,             // Range Minimum
                            0x0810,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED1C000,         // Address Base
                            0x00004000,         // Address Length
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
                            0xFEC00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEE00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x32000000,         // Address Base
                            0x00000100,         // Address Length
                            )
                    })
                }

                Device (SYSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D6))
                        {
                            If (And (OTHR, 0x02))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
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
                            0x164E,             // Range Minimum
                            0x164E,             // Range Maximum
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
                            0x0600,             // Range Minimum
                            0x0600,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0610,             // Range Minimum
                            0x0610,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0810,             // Range Minimum
                            0x0810,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        IO (Decode16,
                            0xFF2C,             // Range Minimum
                            0xFF2C,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED1C000,         // Address Base
                            0x00004000,         // Address Length
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
                            0xFEC00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEE00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x32000000,         // Address Base
                            0x00000100,         // Address Length
                            )
                    })
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

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
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
                    Method (_CRS, 0, Serialized)
                    {
                        If (LEqual (HPTS, 0x01))
                        {
                            Return (BUF0)
                        }
                        Else
                        {
                            Return (BUF1)
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y16)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D7)))
                        {
                            If (LEqual (HPTS, 0x01))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                        Else
                        {
                            If (HPTS)
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        If (LEqual (HPTS, 0x01))
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPC.HPET._Y16._BAS, HPT0)
                            If (LEqual (HPTA, 0x01))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (HPTA, 0x02))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (HPTA, 0x03))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
                }

                Device (PIC)
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

                Device (FPU)
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

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (BUF0, ResourceTemplate ()
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
                    })
                    Name (BUF1, ResourceTemplate ()
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
                    Method (_CRS, 0, Serialized)
                    {
                        If (HPTS)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                    })
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (KBTP, 0x4A))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

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

                Device (KBCJ)
                {
                    Name (_HID, EisaId ("PNP0320"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (KBTP, 0x4A))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

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

                Device (MSE0)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (And (TSTE, 0x01), 0x01))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (MSS0)
                {
                    Name (_HID, EisaId ("SYN1B07"))
                    Name (_CID, Package (0x03)
                    {
                        0x001B2E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (And (TSTE, 0x01), 0x01))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_UID, 0x01)
                    Name (_GPE, 0x1C)
                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BFFR, ResourceTemplate ()
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
                        Return (BFFR)
                    }

                    Name (_ADR, 0x00020000)
                    OperationRegion (HDCS, PCI_Config, 0x00, 0x01)
                    Field (HDCS, ByteAcc, NoLock, Preserve)
                    {
                        OBV,    8
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x60), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMDR,   32, 
                        BCNT,   8, 
                        SMAA,   8, 
                        SMD0,   8, 
                        SMD1,   8, 
                                Offset (0x90), 
                                Offset (0x91), 
                                Offset (0x92), 
                                Offset (0x93), 
                                Offset (0x94), 
                        ERIB,   16, 
                        ERBD,   8, 
                                Offset (0x98), 
                                Offset (0x99), 
                        OSIF,   1, 
                                Offset (0x9A), 
                        BAL1,   1, 
                        BAL2,   1, 
                        BAL3,   1, 
                        BAL4,   1, 
                        BCL1,   1, 
                        BCL2,   1, 
                        BCL3,   1, 
                        BCL4,   1, 
                        BPU1,   1, 
                        BPU2,   1, 
                        BPU3,   1, 
                        BPU4,   1, 
                        BOS1,   1, 
                        BOS2,   1, 
                        BOS3,   1, 
                        BOS4,   1, 
                        PHDD,   1, 
                        IFDD,   1, 
                        IODD,   1, 
                        SHDD,   1, 
                        LS20,   1, 
                        EFDD,   1, 
                        ECRT,   1, 
                        LANC,   1, 
                        SBTN,   1, 
                        VIDO,   1, 
                        VOLD,   1, 
                        VOLU,   1, 
                        MUTE,   1, 
                        CONT,   1, 
                        BRGT,   1, 
                        HBTN,   1, 
                        S4SE,   1, 
                        SKEY,   1, 
                        BKEY,   1, 
                        TKEY,   1, 
                        FKEY,   1, 
                        DVDM,   1, 
                        DIGM,   1, 
                        CDLK,   1, 
                            ,   1, 
                        LIDO,   1, 
                        PMEE,   1, 
                        PBET,   1, 
                        RIIN,   1, 
                        BTWK,   1, 
                        DKIN,   1, 
                                Offset (0xA0), 
                            ,   6, 
                        SWTH,   1, 
                        HWTH,   1, 
                        DKT0,   1, 
                        DKT1,   1, 
                            ,   2, 
                        OSUD,   1, 
                        OSDK,   1, 
                        OSSU,   1, 
                        DKCG,   1, 
                        ODTS,   8, 
                        S1LD,   1, 
                        S3LD,   1, 
                        VGAQ,   1, 
                        PCMQ,   1, 
                        PCMR,   1, 
                        ADPT,   1, 
                        SYS6,   1, 
                        SYS7,   1, 
                        PWAK,   1, 
                        MWAK,   1, 
                        LWAK,   1, 
                        RWAK,   1, 
                            ,   2, 
                        KWAK,   1, 
                        MSWK,   1, 
                        CCAC,   1, 
                        AOAC,   1, 
                        BLAC,   1, 
                        PSRC,   1, 
                        BOAC,   1, 
                        LCAC,   1, 
                        AAAC,   1, 
                        ACAC,   1, 
                        PCEC,   8, 
                        THON,   8, 
                        THSD,   8, 
                        THEM,   8, 
                        TCON,   8, 
                        THRS,   8, 
                        THSE,   8, 
                        FSSN,   4, 
                        FANU,   4, 
                        PTVL,   3, 
                            ,   3, 
                        TTSR,   1, 
                        TTHR,   1, 
                        TSTH,   1, 
                        TSBC,   1, 
                        TSBF,   1, 
                        TSPL,   1, 
                        TSBT,   1, 
                            ,   2, 
                        THTA,   1, 
                        CTMP,   8, 
                        LTMP,   8, 
                        SKTA,   8, 
                        SKTB,   8, 
                        SKTC,   8, 
                        SKTD,   8, 
                        NBTP,   8, 
                        LANP,   1, 
                        LCDS,   1, 
                                Offset (0xB8), 
                        BTPV,   8, 
                        BRTS,   8, 
                        CTRS,   8, 
                        WLAT,   1, 
                        BTAT,   1, 
                        WLEX,   1, 
                        BTEX,   1, 
                        KLSW,   1, 
                        WLOK,   1, 
                                Offset (0xBC), 
                        PJID,   8, 
                        CPUN,   8, 
                        THFN,   8, 
                        MLED,   1, 
                        SCHG,   1, 
                        SCCF,   1, 
                        SCPF,   1, 
                        ACIS,   1, 
                                Offset (0xC0), 
                            ,   7, 
                        BTY0,   1, 
                        BST0,   8, 
                        BRC0,   16, 
                        BSN0,   16, 
                        BPV0,   16, 
                        BDV0,   16, 
                        BDC0,   16, 
                        BFC0,   16, 
                        GAU0,   8, 
                        BSCY,   8, 
                        BSCU,   16, 
                        BAC0,   16, 
                        BTW0,   8, 
                        BATV,   8, 
                        BPTC,   8, 
                        BTTC,   8, 
                        BTMA,   16, 
                        BTSC,   8, 
                        BCIX,   8, 
                        CCBA,   8, 
                        CBOT,   8, 
                        BTSS,   16, 
                        OVCC,   8, 
                        CCFC,   8, 
                        BADC,   8, 
                        BSC1,   16, 
                        BSC2,   16, 
                        BSC3,   16, 
                        BSC4,   16, 
                        BDME,   16, 
                                Offset (0xEE), 
                                Offset (0xEF), 
                                Offset (0xF0), 
                        BTS1,   8, 
                        BTS2,   8, 
                        BSCS,   16, 
                        BDAD,   16, 
                        BACV,   16, 
                        BDFC,   16
                    }

                    OperationRegion (CCLK, SystemIO, 0x0410, 0x04)
                    Field (CCLK, DWordAcc, NoLock, Preserve)
                    {
                            ,   1, 
                        DUTY,   3, 
                        THEN,   1, 
                                Offset (0x01), 
                        FTT,    1, 
                            ,   8, 
                        TSTS,   1
                    }

                    Mutex (FAMX, 0x00)
                    Method (FANG, 1, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg0, ERIB)
                        Store (ERBD, Local0)
                        Release (FAMX)
                        Return (Local0)
                    }

                    Method (FANW, 2, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg0, ERIB)
                        Store (Arg1, ERBD)
                        Release (FAMX)
                        Return (Arg1)
                    }

                    Method (TUVR, 1, NotSerialized)
                    {
                        Return (0x03)
                    }

                    Method (THRO, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Return (THEN)
                        }
                        Else
                        {
                            If (LEqual (Arg0, One))
                            {
                                Return (DUTY)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x02))
                                {
                                    Return (TTHR)
                                }
                                Else
                                {
                                    Return (0xFF)
                                }
                            }
                        }
                    }

                    Method (CLCK, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Store (Zero, THEN)
                        }
                        Else
                        {
                            Store (Arg0, DUTY)
                            Store (One, THEN)
                        }

                        Return (THEN)
                    }

                    Method (PCLK, 0, NotSerialized)
                    {
                        Store (PTVL, Local0)
                        If (LEqual (Local0, Zero))
                        {
                            Store (Zero, THEN)
                        }
                        Else
                        {
                            Not (Local0, Local0)
                            Add (Local0, One, Local0)
                            And (Local0, 0x07, Local0)
                            Store (Local0, DUTY)
                            If (LEqual (Local0, Zero))
                            {
                                Store (Zero, THEN)
                            }
                            Else
                            {
                                Store (One, THEN)
                            }
                        }
                    }

                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECON)
                            If (LEqual (LIDO, \_SB.PCI0.OVGA.CLID))
                            {
                                If (LEqual (LIDO, 0x00))
                                {
                                    \_SB.PCI0.OVGA.GLID (0x01)
                                }
                                Else
                                {
                                    \_SB.PCI0.OVGA.GLID (0x00)
                                }
                            }
                            Else
                            {
                                If (LNot (\_SB.PCI0.OVGA.GLID (LIDO)))
                                {
                                    Store (LIDO, LIDS)
                                    Notify (\_SB.PCI0.LPC.LID0, 0x80)
                                }
                            }
                        }
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D6))
                        {
                            If (LEqual (OBV, 0xFF))
                            {
                                Notify (\_SB.PCI0.PEGP.VGA.LCD, 0x87)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.OVGA.DD03, 0x87)
                            }
                        }
                        Else
                        {
                            If (LEqual (\_SB.PCI0.WMID.BAEF, One))
                            {
                                Store (BRTS, Local1)
                                Store (\_SB.PCI0.WMID.LBL0, Local2)
                                Add (Local2, Local1, Local2)
                                Store (Local2, \_SB.PCI0.WMID.NTDC)
                                Notify (WMID, 0x80)
                            }
                        }
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D6))
                        {
                            If (LEqual (OBV, 0xFF))
                            {
                                Notify (\_SB.PCI0.PEGP.VGA.LCD, 0x86)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.OVGA.DD03, 0x86)
                            }
                        }
                        Else
                        {
                            If (LEqual (\_SB.PCI0.WMID.BAEF, One))
                            {
                                Store (BRTS, Local1)
                                Store (\_SB.PCI0.WMID.LBL0, Local2)
                                Add (Local2, Local1, Local2)
                                Store (Local2, \_SB.PCI0.WMID.NTDC)
                                Notify (WMID, 0x80)
                            }
                        }
                    }

                    Method (_Q1C, 0, NotSerialized)
                    {
                    }

                    Method (_Q1D, 0, NotSerialized)
                    {
                        PCLK ()
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC.BAT0, 0x80)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC.BAT0, 0x81)
                        Notify (\_SB.PCI0.LPC.BAT0, 0x80)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, P80H)
                        If (LEqual (\_SB.PCI0.WMID.BAEF, One))
                        {
                            Store (BTAT, Local1)
                            Store (\_SB.PCI0.WMID.BLTD, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, \_SB.PCI0.WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q37, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC.AC, 0x00)
                        Sleep (0x03F0)
                        Notify (\_SB.PCI0.LPC.BAT0, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q38, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC.AC, 0x01)
                        Sleep (0x03F0)
                        Notify (\_SB.PCI0.LPC.BAT0, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q60, 0, NotSerialized)
                    {
                        Store (0x60, P80H)
                        If (LEqual (\_SB.PCI0.WMID.BAEF, One))
                        {
                            Store (WLAT, Local1)
                            Store (\_SB.PCI0.WMID.WLSD, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, \_SB.PCI0.WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q4F, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.WMID.BAEF, One))
                        {
                            Store (0x01, Local1)
                            If (LEqual (\_SB.PCI0.LPC.EC0.LANC, 0x01))
                            {
                                Store (0x00, Local1)
                            }

                            Store (\_SB.PCI0.WMID.LANI, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, \_SB.PCI0.WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q50, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.WMID.BAEF, One))
                        {
                            Store (0x00, Local1)
                            If (LEqual (\_SB.PCI0.LPC.EC0.LCDS, 0x01))
                            {
                                Store (0x01, Local1)
                            }

                            Store (\_SB.PCI0.WMID.LDOF, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, \_SB.PCI0.WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }
                }

                Device (BAT0)
                {
                    Name (_HID, EisaId ("PNP0C0A"))
                    Name (_UID, 0x01)
                    Name (_PCL, Package (0x01)
                    {
                        \_SB
                    })
                    Name (PBIF, Package (0x0D)
                    {
                        0x01, 
                        0x0FA0, 
                        0x0FA0, 
                        0x01, 
                        0x39D0, 
                        0x0190, 
                        0x78, 
                        0x0108, 
                        0x0EC4, 
                        "Li_Ion 4000mA ", 
                        "", 
                        "Lion", 
                        "Acer   "
                    })
                    Name (PBST, Package (0x04)
                    {
                        0x01, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0x39D0
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (ECON)
                        {
                            If (\_SB.PCI0.LPC.EC0.BAL1)
                            {
                                Sleep (0x14)
                                Return (0x1F)
                            }
                            Else
                            {
                                Sleep (0x14)
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            Sleep (0x14)
                            Return (0x1F)
                        }
                    }

                    Method (_BIF, 0, NotSerialized)
                    {
                        If (ECON)
                        {
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC.EC0.BDC0, Index (PBIF, 0x01))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC.EC0.BFC0, Index (PBIF, 0x02))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC.EC0.BDV0, Index (PBIF, 0x04))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC.EC0.BDC0, Local2)
                            Divide (Local2, 0x64, Local6, Local2)
                            Multiply (Local2, 0x05, Local3)
                            Store (Local3, Index (PBIF, 0x05))
                            Multiply (Local2, 0x03, Local4)
                            Store (Local4, Index (PBIF, 0x06))
                            Store (\_SB.PCI0.LPC.EC0.BTY0, Local1)
                            Sleep (0x14)
                            If (LEqual (Local1, 0x01))
                            {
                                Store ("GC86508SAT0 ", Index (PBIF, 0x09))
                                Store ("SANYO ", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Store ("GC86503SY90 ", Index (PBIF, 0x09))
                                    Store ("SONY ", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x04))
                                    {
                                        Store ("GC86503PAG0 ", Index (PBIF, 0x09))
                                        Store ("PANASONIC ", Index (PBIF, 0x0C))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x05))
                                        {
                                            Store ("GC86508SM60 ", Index (PBIF, 0x09))
                                            Store ("SAMSUNG ", Index (PBIF, 0x0C))
                                        }
                                        Else
                                        {
                                            Store ("BCL3100LiON ", Index (PBIF, 0x09))
                                            Store ("COMPAL ", Index (PBIF, 0x0C))
                                        }
                                    }
                                }
                            }
                        }

                        Return (PBIF)
                    }

                    Method (_BST, 0, NotSerialized)
                    {
                        If (ECON)
                        {
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC.EC0.BST0, Local0)
                            And (Local0, 0x07, Local0)
                            Store (Local0, Index (PBST, 0x00))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC.EC0.GAU0, Local2)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC.EC0.BPV0, Local3)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC.EC0.BFC0, Local1)
                            Sleep (0x14)
                            If (Local2)
                            {
                                Multiply (Local2, Local1, Local2)
                                Divide (Local2, 0x64, Local6, Local2)
                                If (Local6)
                                {
                                    Increment (Local2)
                                }
                            }

                            Store (\_SB.PCI0.LPC.EC0.BAC0, Local1)
                            If (And (Local1, 0x8000, Local1))
                            {
                                Store (\_SB.PCI0.LPC.EC0.BAC0, Local1)
                                Subtract (0xFFFF, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Sleep (0x14)
                            Store (Local1, Index (PBST, 0x01))
                            Store (Local2, Index (PBST, 0x02))
                            Store (Local3, Index (PBST, 0x03))
                        }

                        Return (PBST)
                    }
                }

                Device (AC)
                {
                    Name (_HID, "ACPI0003")
                    Name (_PCL, Package (0x01)
                    {
                        \_SB
                    })
                    Method (_PSR, 0, NotSerialized)
                    {
                        If (ECON)
                        {
                            Store (\_SB.PCI0.LPC.EC0.ADPT, PWRS)
                        }

                        Return (PWRS)
                    }
                }

                Device (PWRB)
                {
                    Name (_HID, EisaId ("PNP0C0C"))
                }

                Device (LID0)
                {
                    Name (_HID, EisaId ("PNP0C0D"))
                    Method (_LID, 0, NotSerialized)
                    {
                        Return (LPDL)
                    }
                }

                Device (SLPB)
                {
                    Name (_HID, EisaId ("PNP0C0E"))
                }
            }

            Device (UHC1)
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
                        Name (_EJD, "\\_SB.PCI0.EXP1.PXS1")
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, 0x01)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (0x00, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
            }

            Device (UHC2)
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

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, 0x01)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (0x00, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x01, URES)
                    }
                }
            }

            Device (UHC3)
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

                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, 0x01)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (0x00, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x01, URES)
                    }
                }
            }

            Device (UHC4)
            {
                Name (_ADR, 0x001A0000)
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

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, 0x01)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (0x00, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x01, URES)
                    }
                }
            }

            Device (UHC5)
            {
                Name (_ADR, 0x001A0001)
                Device (HUB5)
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

                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, 0x01)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (0x00, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x001D0007)
                OperationRegion (U7CS, PCI_Config, 0x54, 0x04)
                Field (U7CS, DWordAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1
                }

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
                        Name (_EJD, "\\_SB.PCI0.EXP1.PXS1")
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
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x001A0007)
                OperationRegion (UFCS, PCI_Config, 0x54, 0x04)
                Field (UFCS, DWordAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1
                }

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
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (0x00)
                        }
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (0x00)
                        }
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (0x00)
                        }
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (EXP1)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (P1CS, PCI_Config, 0x40, 0x0100)
                Field (P1CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   4, 
                    LKD1,   1, 
                            Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                            Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS1)
                {
                    Name (_ADR, 0x00)
                    OperationRegion (P1FG, PCI_Config, 0x00, 0x08)
                    Field (P1FG, DWordAcc, NoLock, Preserve)
                    {
                        P1ID,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (P1ID, 0xFFFFFFFF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                    Name (_EJD, "\\_SB.PCI0.EHC1.HUB7.PRT2")
                    Method (_PRT, 0, NotSerialized)
                    {
                        If (LEqual (\GPIC, Zero))
                        {
                            Return (Package (0x04)
                            {
                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x00, 
                                    \_SB.PCI0.LPC.LNKA, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x01, 
                                    \_SB.PCI0.LPC.LNKB, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x02, 
                                    \_SB.PCI0.LPC.LNKC, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x03, 
                                    \_SB.PCI0.LPC.LNKD, 
                                    0x00
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
                    }
                }
            }

            Device (EXP2)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (P2CS, PCI_Config, 0x40, 0x0100)
                Field (P2CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   4, 
                    LKD2,   1, 
                            Offset (0x1A), 
                    ABP2,   1, 
                        ,   2, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                            Offset (0x20), 
                    RID2,   16, 
                    PSP2,   1, 
                    PPP2,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS2)
                {
                    Name (_ADR, 0x00)
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (\GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC.LNKA, 
                                0x00
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
                }
            }

            Device (EXP3)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   4, 
                    LKD3,   1, 
                            Offset (0x1A), 
                    ABP3,   1, 
                        ,   2, 
                    PDC3,   1, 
                        ,   2, 
                    PDS3,   1, 
                            Offset (0x20), 
                    RID3,   16, 
                    PSP3,   1, 
                    PPP3,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS3)
                {
                    Name (_ADR, 0x00)
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (\GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC.LNKB, 
                                0x00
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
                }
            }

            Device (EXP4)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (P4CS, PCI_Config, 0x40, 0x0100)
                Field (P4CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   4, 
                    LKD4,   1, 
                            Offset (0x1A), 
                    ABP4,   1, 
                        ,   2, 
                    PDC4,   1, 
                        ,   2, 
                    PDS4,   1, 
                            Offset (0x20), 
                    RID4,   16, 
                    PSP4,   1, 
                    PPP4,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS4)
                {
                    Name (_ADR, 0x00)
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (\GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC.LNKC, 
                                0x00
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
                }
            }

            Device (EXP5)
            {
                Name (_ADR, 0x001C0004)
                OperationRegion (P5CS, PCI_Config, 0x40, 0x0100)
                Field (P5CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   4, 
                    LKD5,   1, 
                            Offset (0x1A), 
                    ABP5,   1, 
                        ,   2, 
                    PDC5,   1, 
                        ,   2, 
                    PDS5,   1, 
                            Offset (0x20), 
                    RID5,   16, 
                    PSP5,   1, 
                    PPP5,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS5)
                {
                    Name (_ADR, 0x00)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (\GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC.LNKD, 
                                0x00
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
                }
            }

            Device (EXP6)
            {
                Name (_ADR, 0x001C0005)
                OperationRegion (P6CS, PCI_Config, 0x40, 0x0100)
                Field (P6CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   4, 
                    LKD6,   1, 
                            Offset (0x1A), 
                    ABP6,   1, 
                        ,   2, 
                    PDC6,   1, 
                        ,   2, 
                    PDS6,   1, 
                            Offset (0x20), 
                    RID6,   16, 
                    PSP6,   1, 
                    PPP6,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS6)
                {
                    Name (_ADR, 0x00)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (\GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC.LNKA, 
                                0x00
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
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x001B0000)
                OperationRegion (HDCS, PCI_Config, 0x54, 0x04)
                Field (HDCS, DWordAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1
                }

                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKMD, 0x01))
                    {
                        Return (Package (0x02)
                        {
                            0x0D, 
                            0x04
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            0x0D, 
                            0x00
                        })
                    }
                }
            }

            Device (AUDO)
            {
                Name (_ADR, 0x001E0002)
            }

            Device (MODM)
            {
                Name (_ADR, 0x001E0003)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKMD, 0x01))
                    {
                        Return (Package (0x02)
                        {
                            0x05, 
                            0x04
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            0x05, 
                            0x00
                        })
                    }
                }
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (\GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC.LNKD, 
                                0x00
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
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x14
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
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Name (SWIT, 0x01)
                    Name (CRTA, 0x01)
                    Name (LCDA, 0x01)
                    Name (TVAA, 0x01)
                    Name (VLDF, 0x01)
                    OperationRegion (VIDS, PCI_Config, 0x00, 0xC8)
                    Field (VIDS, DWordAcc, NoLock, Preserve)
                    {
                        VDID,   32
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS1, 0, NotSerialized)
                    {
                        Store (0x01, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200
                        })
                    }

                    Device (CRT)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            OSMI (0x90)
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
                            And (Local0, 0x02, Local0)
                            And (Local1, 0x02, Local1)
                            If (Local0)
                            {
                                Store (0x01, CRTA)
                            }
                            Else
                            {
                                Store (0x00, CRTA)
                            }

                            If (CRTA)
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            OSMI (0x90)
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
                            And (Local0, 0x01, Local0)
                            And (Local1, 0x01, Local1)
                            If (Local0)
                            {
                                Store (0x01, LCDA)
                            }
                            Else
                            {
                                Store (0x00, LCDA)
                            }

                            If (LCDA)
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }

                        Method (_BCL, 0, NotSerialized)
                        {
                            Return (Package (0x0C)
                            {
                                0x46, 
                                0x28, 
                                0x0A, 
                                0x14, 
                                0x1E, 
                                0x28, 
                                0x32, 
                                0x3C, 
                                0x46, 
                                0x50, 
                                0x5A, 
                                0x64
                            })
                        }

                        Method (_BCM, 1, NotSerialized)
                        {
                            Divide (Arg0, 0x0A, Local0, Local1)
                            Decrement (Local1)
                            Store (Local1, \_SB.PCI0.LPC.EC0.BRTS)
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            Multiply (\_SB.PCI0.LPC.EC0.BRTS, 0x0A, Local0)
                            Add (Local0, 0x01, Local0)
                            Sleep (0x64)
                            Return (Local0)
                        }
                    }

                    Device (TV)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            OSMI (0x90)
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
                            And (Local0, 0x04, Local0)
                            And (Local1, 0x04, Local1)
                            If (Local0)
                            {
                                Store (0x01, TVAA)
                            }
                            Else
                            {
                                Store (0x00, TVAA)
                            }

                            If (TVAA)
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (TVAA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Method (DSSW, 0, NotSerialized)
                    {
                        If (LEqual (SWIT, 0x00))
                        {
                            OSMI (0x90)
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
                            If (LGreater (Local1, 0x01))
                            {
                                And (Local0, Local1, VLDF)
                                And (VLDF, 0xFE, VLDF)
                            }

                            If (VLDF)
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x04)
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        STBL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x05))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x06)
                                    }

                                    If (LEqual (Local1, 0x05))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x04))
                                    {
                                        STBL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x07))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x04)
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        STBL (0x06)
                                    }

                                    If (LEqual (Local1, 0x05))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x04))
                                    {
                                        STBL (0x01)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, VLDF)
                                STBL (0x01)
                            }
                        }
                        Else
                        {
                            If (LEqual (SWIT, 0x01))
                            {
                                OSMI (0x91)
                            }
                        }
                    }

                    Method (STBL, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Store (One, CRTA)
                            Store (Zero, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Zero, CRTA)
                            Store (Zero, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x06))
                        {
                            Store (One, CRTA)
                            Store (Zero, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x07))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        Notify (\_SB.PCI0.PEGP.VGA, 0x80)
                    }
                }
            }

            Device (OVGA)
            {
                Name (_ADR, 0x00020000)
                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x07), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Store (0x00, NDID)
                    If (LNotEqual (DIDL, Zero))
                    {
                        Store (SDDL (DID1), DID1)
                    }

                    If (LNotEqual (DDL2, Zero))
                    {
                        Store (SDDL (DID2), DID2)
                    }

                    If (LNotEqual (DDL3, Zero))
                    {
                        Store (SDDL (DID3), DID3)
                    }

                    If (LNotEqual (DDL4, Zero))
                    {
                        Store (SDDL (DID4), DID4)
                    }

                    If (LNotEqual (DDL5, Zero))
                    {
                        Store (SDDL (DID5), DID5)
                    }

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

                    If (LGreater (NDID, 0x04))
                    {
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
                        Store (Or (0x00010000, DID4), Index (TMP5, 0x04))
                        Return (TMP5)
                    }

                    Return (Package (0x01)
                    {
                        0x0400
                    })
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID1, 0x00))
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID1))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (CDDS (DID1))
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID1))
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
                        If (LEqual (DID2, 0x00))
                        {
                            Return (0x02)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID2))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (CDDS (DID2))
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID2))
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
                        If (LEqual (DID3, 0x00))
                        {
                            Return (0x03)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID3))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID3, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID3))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID3))
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }

                    Method (_BCL, 0, NotSerialized)
                    {
                        Return (Package (0x0C)
                        {
                            0x46, 
                            0x28, 
                            0x0A, 
                            0x14, 
                            0x1E, 
                            0x28, 
                            0x32, 
                            0x3C, 
                            0x46, 
                            0x50, 
                            0x5A, 
                            0x64
                        })
                    }

                    Method (_BCM, 1, NotSerialized)
                    {
                        Divide (Arg0, 0x0A, Local0, Local1)
                        Decrement (Local1)
                        Store (Local1, \_SB.PCI0.LPC.EC0.BRTS)
                    }

                    Method (_BQC, 0, NotSerialized)
                    {
                        Multiply (\_SB.PCI0.LPC.EC0.BRTS, 0x0A, Local0)
                        Add (Local0, 0x01, Local0)
                        Sleep (0x64)
                        Return (Local0)
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID4, 0x00))
                        {
                            Return (0x04)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID4))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID4, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID4))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID4))
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
                        If (LEqual (DID5, 0x00))
                        {
                            Return (0x05)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID5))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID5, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID5))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID5))
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Method (SDDL, 1, NotSerialized)
                {
                    Increment (NDID)
                    Store (And (Arg0, 0x0F0F), Local0)
                    Or (0x80000000, Local0, Local1)
                    If (LEqual (DIDL, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL2, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL3, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL4, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL5, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL6, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL7, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL8, Local0))
                    {
                        Return (Local1)
                    }

                    Return (0x00)
                }

                Method (CDDS, 1, NotSerialized)
                {
                    If (LEqual (CADL, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL2, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL3, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL4, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL5, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL6, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL7, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL8, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    Return (0x1D)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    If (LEqual (NADL, And (Arg0, 0x0F0F)))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL2, And (Arg0, 0x0F0F)))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL3, And (Arg0, 0x0F0F)))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL4, And (Arg0, 0x0F0F)))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL5, And (Arg0, 0x0F0F)))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL6, And (Arg0, 0x0F0F)))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL7, And (Arg0, 0x0F0F)))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL8, And (Arg0, 0x0F0F)))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Scope (\_SB.PCI0)
                {
                    OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)
                    Field (MCHP, AnyAcc, NoLock, Preserve)
                    {
                                Offset (0x60), 
                        TASM,   9, 
                                Offset (0x62)
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                            Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                            Offset (0x18), 
                            Offset (0xA4), 
                    ASLE,   8, 
                            Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                            Offset (0xB0), 
                            Offset (0xB1), 
                    CDVL,   5, 
                            Offset (0xB2), 
                            Offset (0xB5), 
                    LBPC,   8, 
                            Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                            Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                            Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                            Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                            Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                            Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                            Offset (0x400), 
                    GVD1,   57344
                }

                Name (DBTB, Package (0x15)
                {
                    0x00, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x03)
                {
                    Package (0x03)
                    {
                        0xC8, 
                        0x0140, 
                        0x0190
                    }, 

                    Package (0x03)
                    {
                        0xC8, 
                        0x014D, 
                        0x0190
                    }, 

                    Package (0x03)
                    {
                        0xDE, 
                        0x014D, 
                        0x017D
                    }
                })
                Name (SUCC, 0x01)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x0279, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x01))
                        {
                            Store (0x0240, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            And (PARM, 0xEFFF0000, PARM)
                            And (PARM, ShiftLeft (DerefOf (Index (DBTB, IBTT)), 0x10), 
                                PARM)
                            Or (IBTT, PARM, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (IPSC, PARM)
                            Or (PARM, ShiftLeft (IPAT, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Or (PARM, ShiftLeft (LIDS, 0x10), PARM)
                            Add (PARM, 0x00010000, PARM)
                            Or (PARM, ShiftLeft (IBIA, 0x14), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (ITVF, PARM)
                            Or (PARM, ShiftLeft (ITVM, 0x04), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (GIVD, PARM)
                            XOr (PARM, 0x01, PARM)
                            Or (PARM, ShiftLeft (GMFN, 0x01), PARM)
                            Or (PARM, ShiftLeft (0x02, 0x0B), PARM)
                            If (LLess (TASM, 0x04))
                            {
                                Or (PARM, ShiftLeft (0x01, 0x11), PARM)
                            }
                            Else
                            {
                                If (LLess (TASM, 0x08))
                                {
                                    Or (PARM, ShiftLeft (0x02, 0x11), PARM)
                                }
                                Else
                                {
                                    Or (PARM, ShiftLeft (0x03, 0x11), PARM)
                                }
                            }

                            Or (ShiftLeft (DerefOf (Index (DerefOf (Index (CDCT, HVCO)), Subtract (
                                CDVL, 0x01))), 0x15), PARM, PARM)
                            Store (0x01, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            Store (0x00, PARM)
                            If (ISSC)
                            {
                                Or (0x03, PARM, PARM)
                            }

                            Store (0x00, GESF)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (CRIT)
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x00, PARM)
                            Store (0xF7FD, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x01))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x03))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (And (PARM, 0x0F), ITVF)
                            Store (ShiftRight (And (PARM, 0xF0), 0x04), ITVM)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x08))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x09))
                        {
                            And (PARM, 0xFF, IBTT)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            And (PARM, 0xFF, IPSC)
                            If (And (ShiftRight (PARM, 0x08), 0xFF))
                            {
                                And (ShiftRight (PARM, 0x08), 0xFF, IPAT)
                                Decrement (IPAT)
                            }

                            And (ShiftRight (PARM, 0x14), 0x07, IBIA)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            And (ShiftRight (PARM, 0x01), 0x01, IF1E)
                            If (And (PARM, ShiftLeft (0x0F, 0x0D)))
                            {
                                And (ShiftRight (PARM, 0x0D), 0x0F, IDMS)
                                Store (0x00, IDMM)
                            }
                            Else
                            {
                                And (ShiftRight (PARM, 0x11), 0x0F, IDMS)
                                Store (0x01, IDMM)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x10))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x11))
                        {
                            Store (ShiftLeft (LIDS, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x12))
                        {
                            If (And (PARM, 0x01))
                            {
                                If (LEqual (ShiftRight (PARM, 0x01), 0x01))
                                {
                                    Store (0x01, ISSC)
                                }
                                Else
                                {
                                    Store (Zero, GESF)
                                    Return (CRIT)
                                }
                            }
                            Else
                            {
                                Store (0x00, ISSC)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x13))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (SUCC)
                    }

                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC)
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC)
                    }

                    Store (0x00, GEFC)
                    Store (0x01, SCIS)
                    Store (0x00, GSSE)
                    Store (0x00, SCIE)
                    Return (Zero)
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (LNot (DRDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (DRDY))
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If (LGreater (CSTS, 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return (LEqual (CSTS, 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (0x01)
                    }

                    If (PSTS ())
                    {
                        Return (0x01)
                    }

                    Store (Arg0, CEVT)
                    Store (0x03, CSTS)
                    If (LAnd (LEqual (CHPD, 0x00), LEqual (Arg1, 0x00)))
                    {
                        If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D7)))
                        {
                            Notify (\_SB.PCI0, Arg1)
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.OVGA, Arg1)
                        }
                    }

                    Notify (\_SB.PCI0.OVGA, 0x80)
                    If (LNot (PSTS ()))
                    {
                        Store (0x00, CEVT)
                    }

                    Return (0x00)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    Store (Arg0, TIDX)
                    Return (GNOT (0x01, 0x00))
                }

                Method (GLID, 1, NotSerialized)
                {
                    Store (0x010D, P80H)
                    Store (Arg0, CLID)
                    Return (GNOT (0x02, 0x00))
                }

                Method (GDCK, 1, NotSerialized)
                {
                    Store (Arg0, CDCK)
                    Return (GNOT (0x04, 0x80))
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (LNot (ARDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (ARDY))
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (LNot (And (TCHE, ShiftLeft (0x01, Arg0))))
                    {
                        Return (0x01)
                    }

                    If (PARD ())
                    {
                        Return (0x01)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        XOr (PFIT, 0x07, PFIT)
                        Or (PFIT, 0x80000000, PFIT)
                        Store (0x04, ASLC)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Divide (Multiply (Arg1, 0xFF), 0x64, ), BCLP)
                            Or (BCLP, 0x80000000, BCLP)
                            Store (0x02, ASLC)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x00))
                            {
                                Store (Arg1, ALSI)
                                Store (0x01, ASLC)
                            }
                            Else
                            {
                                Return (0x01)
                            }
                        }
                    }

                    Store (0x00, LBPC)
                    Return (0x00)
                }

                Method (SCIP, 0, NotSerialized)
                {
                    If (LNotEqual (OVER, 0x00))
                    {
                        Return (LNot (GSMI))
                    }

                    Return (0x00)
                }
            }

            Device (IDEC)
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

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        If (LNotEqual (SCFG, 0x04))
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
                            Return (PBUF)
                        }
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        If (LNotEqual (SCFG, 0x04))
                        {
                            CreateDWordField (Arg0, 0x00, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (PRIT, 0x40F0, PRIT)
                                And (SYNC, 0x0E, SYNC)
                                Store (0x00, SDT0)
                                And (ICR0, 0x0E, ICR0)
                                And (ICR1, 0x0E, ICR1)
                                And (ICR3, 0x0E, ICR3)
                                And (ICR5, 0x0E, ICR5)
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

                                    Or (ICR1, 0x01, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (PRIT, 0x3F0F, PRIT)
                                Store (0x00, PSIT)
                                And (SYNC, 0x0D, SYNC)
                                Store (0x00, SDT1)
                                And (ICR0, 0x0D, ICR0)
                                And (ICR1, 0x0D, ICR1)
                                And (ICR3, 0x0D, ICR3)
                                And (ICR5, 0x0D, ICR5)
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
                            If (LNotEqual (SCFG, 0x04))
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
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LNotEqual (SCFG, 0x04))
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

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Sleep (0x01F4)
                        If (LNotEqual (SCFG, 0x04))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0010 */    0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, 0x00, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, 0xFFFFFFFF))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (SECT, 0x4000))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (SSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (0xFFFFFFFF, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, 0xFFFFFFFF))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            If (And (LEqual (PIO0, 0xFFFFFFFF), LEqual (DMA0, 0xFFFFFFFF)))
                            {
                                Store (0x78, PIO0)
                                Store (0x14, DMA0)
                                Store (0x03, FLAG)
                            }

                            Return (SBUF)
                        }
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        If (LNotEqual (SCFG, 0x04))
                        {
                            CreateDWordField (Arg0, 0x00, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (0x00, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x7E, W630)
                                CreateWordField (Arg1, 0x80, W640)
                                CreateWordField (Arg1, 0xB0, W880)
                                CreateWordField (Arg1, 0xBA, W930)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, 0x01))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    If (And (W930, 0x2000))
                                    {
                                        Or (ICR1, 0x04, ICR1)
                                    }
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (0x00, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (0x00, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x7E, W631)
                                CreateWordField (Arg2, 0x80, W641)
                                CreateWordField (Arg2, 0xB0, W881)
                                CreateWordField (Arg2, 0xBA, W931)
                                Or (SECT, 0x8040, SECT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (SECT, 0x20, SECT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (SECT, 0x4000, SECT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (SECT, 0x80, SECT)
                                    }
                                    Else
                                    {
                                        Or (SECT, 0x10, SECT)
                                        Store (SETT (PIO1, W531, W641), SSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    If (And (W931, 0x2000))
                                    {
                                        Or (ICR1, 0x08, ICR1)
                                    }
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LNotEqual (SCFG, 0x04))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, 0x01, PMD0)
                                CreateByteField (SIB0, 0x08, DMD0)
                                If (And (SECT, 0x02))
                                {
                                    If (LEqual (And (SECT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
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

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LNotEqual (SCFG, 0x04))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, 0x01, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
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

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }
                        }
                    }
                }

                Device (PRT0)
                {
                    Name (_ADR, 0xFFFF)
                    Method (_SDD, 1, NotSerialized)
                    {
                        If (LEqual (SCFG, 0x04))
                        {
                            Name (GBU0, Buffer (0x07)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00
                            })
                            CreateByteField (GBU0, 0x00, GB00)
                            CreateByteField (GBU0, 0x01, GB01)
                            CreateByteField (GBU0, 0x02, GB02)
                            CreateByteField (GBU0, 0x03, GB03)
                            CreateByteField (GBU0, 0x04, GB04)
                            CreateByteField (GBU0, 0x05, GB05)
                            CreateByteField (GBU0, 0x06, GB06)
                            If (LEqual (SizeOf (Arg0), 0x0200))
                            {
                                CreateWordField (Arg0, 0x9C, W780)
                                CreateWordField (Arg0, 0x9E, W790)
                                If (LAnd (W780, 0x04))
                                {
                                    If (LEqual (And (W790, 0x04), 0x00))
                                    {
                                        Store (0x10, GB00)
                                        Store (0x03, GB01)
                                        Store (0xEF, GB06)
                                    }
                                }
                            }

                            Store (GBU0, GTF0)
                        }
                    }

                    Method (_GTF, 0, NotSerialized)
                    {
                        If (LAnd (LEqual (SCFG, 0x04), LEqual (AIBT, 0x00)))
                        {
                            Return (GTF0)
                        }
                    }
                }

                Device (PRT2)
                {
                    Name (_ADR, 0x0002FFFF)
                    Method (_SDD, 1, NotSerialized)
                    {
                        If (LEqual (SCFG, 0x04))
                        {
                            Name (GBU2, Buffer (0x07)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00
                            })
                            CreateByteField (GBU2, 0x00, GB20)
                            CreateByteField (GBU2, 0x01, GB21)
                            CreateByteField (GBU2, 0x02, GB22)
                            CreateByteField (GBU2, 0x03, GB23)
                            CreateByteField (GBU2, 0x04, GB24)
                            CreateByteField (GBU2, 0x05, GB25)
                            CreateByteField (GBU2, 0x06, GB26)
                            If (LEqual (SizeOf (Arg0), 0x0200))
                            {
                                CreateWordField (Arg0, 0x9C, W782)
                                CreateWordField (Arg0, 0x9E, W792)
                                If (LAnd (W782, 0x04))
                                {
                                    If (LEqual (And (W792, 0x04), 0x00))
                                    {
                                        Store (0x10, GB20)
                                        Store (0x03, GB21)
                                        Store (0xEF, GB26)
                                    }
                                }
                            }

                            Store (GBU2, GTF2)
                        }
                    }

                    Method (_GTF, 0, NotSerialized)
                    {
                        If (LAnd (LEqual (SCFG, 0x04), LEqual (AIBT, 0x00)))
                        {
                            Return (GTF2)
                        }
                    }
                }
            }

            Device (MIR)
            {
                Name (_HID, EisaId ("ENE0100"))
                Method (_STA, 0, NotSerialized)
                {
                    If (LGreaterEqual (OSYS, 0x07D6))
                    {
                        If (And (OTHR, 0x02))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0xFF2C,             // Range Minimum
                            0xFF2C,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {4}
                    })
                    Return (BUF0)
                }

                Name (_PRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0xFF2C,             // Range Minimum
                        0xFF2C,             // Range Maximum
                        0x01,               // Alignment
                        0x04,               // Length
                        )
                    IRQNoFlags ()
                        {4}
                })
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
                Name (BADG, Package (0x0D)
                {
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00, 
                    0x00010000
                })
                Name (WLDS, 0x00)
                Name (WLED, 0x00)
                Name (BTDS, 0x00)
                Name (BTED, 0x00)
                Name (BLDS, 0x00)
                Name (BLED, 0x00)
                Name (NTDC, 0x00)
                Name (NTDV, 0x00)
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
                Name (CADI, 0x0401)
                Name (CADO, 0x0400)
                Name (GSEE, 0x0501)
                Name (GSED, 0x0502)
                Name (VAPI, 0x0601)
                Name (VAPO, 0x0600)
                Name (WBBO, 0x0701)
                Name (WBBI, 0x0700)
                Name (G3MD, 0x0800)
                Name (G3ME, 0x0801)
                Name (LANI, 0x0900)
                Name (LANO, 0x0901)
                Name (LDOF, 0x0A00)
                Name (LDON, 0x0A01)
                Name (FNKE, 0x00010002)
                Name (FNF5, 0x00015001)
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
                Name (BEDS, Package (0x12)
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
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (WIT0, 0x00)
                Name (DSY6, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
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
                    Store (\_SB.PCI0.LPC.EC0.WLEX, AS00)
                    Store (\_SB.PCI0.LPC.EC0.BTEX, AS01)
                    Store (0x00, AS02)
                    Store (0x00, AS03)
                }

                Method (WGDS, 1, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (Arg0, _T_0)
                    If (LEqual (_T_0, 0x01))
                    {
                        Store (\_SB.PCI0.LPC.EC0.WLAT, Index (BADG, 0x00))
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Store (\_SB.PCI0.LPC.EC0.BTAT, Index (BADG, 0x01))
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Store (\_SB.PCI0.LPC.EC0.BRTS, Index (BADG, 0x02))
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x08))
                                {
                                    Store (0x01, Index (BADG, 0x07))
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x09))
                                    {
                                        Store (0x00, Index (BADG, 0x08))
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x0C))
                                        {
                                            If (And (OTHR, 0x01))
                                            {
                                                Store (0x00010000, Index (BADG, 0x0B))
                                            }
                                            Else
                                            {
                                                Store (\_SB.PCI0.LPC.EC0.LANC, Index (BADG, 0x0B))
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x0D))
                                            {
                                                Store (\_SB.PCI0.LPC.EC0.LCDS, Index (BADG, 0x0C))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (WSDS, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    Store (Arg0, Local0)
                    Store (BF00, Local1)
                    Store (0x00, Index (BADG, Subtract (Local0, 0x01)))
                    Name (_T_0, Zero)
                    Store (Local1, _T_0)
                    If (LEqual (_T_0, 0x00))
                    {
                        Name (_T_1, Zero)
                        Store (Local0, _T_1)
                        If (LEqual (_T_1, 0x04))
                        {
                            Store (0x00, \_SB.PCI0.LPC.EC0.WLAT)
                        }
                        Else
                        {
                            If (LEqual (_T_1, 0x05))
                            {
                                Store (0x00, \_SB.PCI0.LPC.EC0.BTAT)
                            }
                            Else
                            {
                                If (LEqual (_T_1, 0x06))
                                {
                                    Store (0x00, \_SB.PCI0.LPC.EC0.BRTS)
                                }
                                Else
                                {
                                    If (LEqual (_T_1, 0x07))
                                    {
                                        Store (0x00, BAEF)
                                    }
                                    Else
                                    {
                                        Store (0x0100, Index (BADG, Subtract (Local0, 0x01)))
                                    }
                                }
                            }
                        }
                    }
                    Else
                    {
                        Name (_T_2, Zero)
                        Store (Local0, _T_2)
                        If (LEqual (_T_2, 0x04))
                        {
                            Store (0x01, \_SB.PCI0.LPC.EC0.WLAT)
                        }
                        Else
                        {
                            If (LEqual (_T_2, 0x05))
                            {
                                Store (0x01, \_SB.PCI0.LPC.EC0.BTAT)
                            }
                            Else
                            {
                                If (LEqual (_T_2, 0x06))
                                {
                                    Store (Local1, \_SB.PCI0.LPC.EC0.BRTS)
                                }
                                Else
                                {
                                    If (LEqual (_T_2, 0x07))
                                    {
                                        Store (0x01, BAEF)
                                    }
                                    Else
                                    {
                                        Store (0x0100, Index (BADG, Subtract (Local0, 0x01)))
                                    }
                                }
                            }
                        }
                    }
                }

                Method (OEMN, 0, NotSerialized)
                {
                    If (LEqual (BGEF, 0x01))
                    {
                        Store (NTDV, Local0)
                        If (LNotEqual (Local0, 0x00))
                        {
                            Store (0x00, NTDV)
                            Return (Local0)
                        }
                    }

                    If (LEqual (BAEF, 0x01))
                    {
                        Store (NTDC, Local0)
                        If (LNotEqual (Local0, 0x00))
                        {
                            Store (0x00, NTDC)
                            Return (Local0)
                        }
                    }

                    If (LEqual (BFEF, 0x01)) {}
                }

                Method (STRL, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, BUFF)
                    Store (0x00, BBSB)
                    Name (_T_0, Zero)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, 0x01))
                    {
                        Store (\_SB.PCI0.LPC.EC0.THRO (0x00), Local1)
                        If (And (Local1, 0x01))
                        {
                            Store (\_SB.PCI0.LPC.EC0.THRO (0x01), Local1)
                            Store (Local1, BBSB)
                        }
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Store (BF00, Local1)
                            \_SB.PCI0.LPC.EC0.CLCK (Local1)
                        }
                        Else
                        {
                            Store (0x00010000, BBSB)
                        }
                    }
                }

                Method (WODP, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (\_SB.PCI0.LPC.EC0.LANP, Index (BCDS, Subtract (Arg0, 0x01)))
                    }
                    Else
                    {
                        Store (0x01, Index (BCDS, Subtract (Arg0, 0x01)))
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        If (Arg1)
                        {
                            Store (0x01, \_SB.PCI0.LPC.EC0.LANP)
                        }
                        Else
                        {
                            Store (0x00, \_SB.PCI0.LPC.EC0.LANP)
                        }

                        Store (0x00, Index (BCDS, Subtract (Arg0, 0x0A)))
                    }
                    Else
                    {
                        Store (0x01, Index (BCDS, Subtract (Arg0, 0x0A)))
                    }
                }

                Method (GCPU, 1, NotSerialized)
                {
                    Store (DSY5, DSY0)
                    Store (Arg0, Local0)
                    Store (IHWM (0x00, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY00)
                    Store (DY61, DY01)
                    Store (DY62, DY02)
                    Store (DY63, DY03)
                }

                Method (MSRR, 1, NotSerialized)
                {
                    Store (DSY3, DSY1)
                    Store (Arg0, DY00)
                    Store (IHWM (0x01, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY10)
                    Store (DY61, DY11)
                    Store (0x00, WIT0)
                    Store (WIT0, DY12)
                }

                Method (MSRW, 1, NotSerialized)
                {
                    Store (DSY3, DSY1)
                    Store (IHWM (0x02, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY10)
                    Store (DY61, DY11)
                    Store (0x00, WIT0)
                    Store (WIT0, DY12)
                }

                Method (C4C3, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    If (LNotEqual (And (PPMF, 0x80), 0x80))
                    {
                        Store (0x00010000, Index (BCDS, 0x09))
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x04))
                        {
                            Store (BF00, \_SB.PCI0.LPC.C4O3)
                            Store (BF00, Index (BCDS, 0x09))
                        }
                        Else
                        {
                            Store (\_SB.PCI0.LPC.C4O3, Index (BCDS, 0x09))
                        }
                    }
                }

                Method (CPUF, 0, NotSerialized)
                {
                    Store (\_SB.PCI0.LPC.EC0.THFN, Local0)
                    Multiply (Local0, 0x64, Local1)
                    Store (Local1, Index (BCDS, 0x0A))
                }

                Method (CPUT, 0, NotSerialized)
                {
                    Store (\_SB.PCI0.LPC.EC0.CTMP, Index (BCDS, 0x0B))
                }

                Method (PCIR, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (IHWM (0x03, Arg0), Local2)
                    Store (Local2, DY20)
                    Store (Local2, DSY6)
                    Store (DSY4, DSY2)
                    Store (DY60, DY20)
                }

                Method (PCIW, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg0, DY20)
                    Store (IHWM (0x04, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY61, BUFF)
                }

                Method (CPUS, 0, NotSerialized)
                {
                    Store (IHWM (0x05, 0x00), Local2)
                    Store (Local2, BUFF)
                    Store (BUFF, Index (BCDS, 0x0C))
                }

                Method (PCID, 1, NotSerialized)
                {
                    Store (IHWM (0x06, Arg0), Local2)
                    Store (Local2, DSY6)
                }

                Method (BTIF, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, BUFF)
                    If (LEqual (Local0, 0x0D))
                    {
                        Store (BF02, BF00)
                        Store (BF01, Local1)
                        Store (BF02, BF00)
                        Store (BF01, Local1)
                    }

                    If (LEqual (Local0, 0x0E))
                    {
                        If (LEqual (BF00, 0x00))
                        {
                            Store (0xFF, BF00)
                        }
                        Else
                        {
                            Store (BF00, Local1)
                            Store (0x01, BF00)
                        }
                    }

                    Name (_T_0, Zero)
                    Store (BF00, _T_0)
                    If (LEqual (_T_0, 0x01))
                    {
                        If (LEqual (\_SB.PCI0.LPC.EC0.BDC0, 0x00))
                        {
                            Store (0x00020000, Local1)
                            Decrement (Local0)
                            Store (Local1, Index (BEDS, Local0))
                        }
                        Else
                        {
                            Name (_T_1, Zero)
                            Store (Local0, _T_1)
                            If (LEqual (_T_1, 0x01))
                            {
                                Store (0x00, Index (BEDS, 0x00))
                            }
                            Else
                            {
                                If (LEqual (_T_1, 0x02))
                                {
                                    Store (\_SB.PCI0.LPC.EC0.BPTC, Index (BEDS, 0x01))
                                }
                                Else
                                {
                                    If (LEqual (_T_1, 0x03))
                                    {
                                        Store (\_SB.PCI0.LPC.EC0.BPV0, Index (BEDS, 0x02))
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_1, 0x04))
                                        {
                                            Store (\_SB.PCI0.LPC.EC0.BSCU, Index (BEDS, 0x03))
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_1, 0x05))
                                            {
                                                Store (\_SB.PCI0.LPC.EC0.BRC0, Index (BEDS, 0x04))
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_1, 0x06))
                                                {
                                                    Store (\_SB.PCI0.LPC.EC0.BFC0, Index (BEDS, 0x05))
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_1, 0x07))
                                                    {
                                                        Store (\_SB.PCI0.LPC.EC0.BSCY, Index (BEDS, 0x06))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_1, 0x08))
                                                        {
                                                            Store (\_SB.PCI0.LPC.EC0.BDC0, Index (BEDS, 0x07))
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_1, 0x09))
                                                            {
                                                                Store (\_SB.PCI0.LPC.EC0.BDV0, Index (BEDS, 0x08))
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_1, 0x0A))
                                                                {
                                                                    Store (\_SB.PCI0.LPC.EC0.BDAD, Index (BEDS, 0x09))
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_1, 0x0B))
                                                                    {
                                                                        Store (\_SB.PCI0.LPC.EC0.BSN0, Index (BEDS, 0x0A))
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_1, 0x0C))
                                                                        {
                                                                            If (LEqual (\_SB.PCI0.LPC.EC0.ACIS, 0x01))
                                                                            {
                                                                                Store (0x00, \_SB.PCI0.LPC.EC0.PSRC)
                                                                                Store (0x01, Index (BEDS, 0x0B))
                                                                            }
                                                                            Else
                                                                            {
                                                                                Store (0x00020000, Index (BEDS, 0x0B))
                                                                            }
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (_T_1, 0x0D))
                                                                            {
                                                                                Store (Local1, \_SB.PCI0.LPC.EC0.BTMA)
                                                                                Store (0x01, \_SB.PCI0.LPC.EC0.SCCF)
                                                                                Store (0x01, Index (BEDS, 0x0C))
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (_T_1, 0x0E))
                                                                                {
                                                                                    Store (Local1, \_SB.PCI0.LPC.EC0.BTPV)
                                                                                    Store (0x00, \_SB.PCI0.LPC.EC0.SCHG)
                                                                                    Store (0x01, \_SB.PCI0.LPC.EC0.SCPF)
                                                                                    Store (0x01, Index (BEDS, 0x0D))
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (_T_1, 0x0F))
                                                                                    {
                                                                                        Store (\_SB.PCI0.LPC.EC0.BDFC, Index (BEDS, 0x0E))
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                        If (LEqual (_T_1, 0x10))
                                                                                        {
                                                                                            Store (\_SB.PCI0.LPC.EC0.BDME, Index (BEDS, 0x0F))
                                                                                        }
                                                                                        Else
                                                                                        {
                                                                                            If (LEqual (_T_1, 0x11))
                                                                                            {
                                                                                                Store (0x03E8, Index (BEDS, 0x10))
                                                                                            }
                                                                                            Else
                                                                                            {
                                                                                                If (LEqual (_T_1, 0x12))
                                                                                                {
                                                                                                    Store (0x00, Index (BEDS, 0x11))
                                                                                                }
                                                                                                Else
                                                                                                {
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Else
                    {
                        Name (_T_2, Zero)
                        Store (Local0, _T_2)
                        If (LEqual (_T_2, 0x01))
                        {
                            Store (0x00020000, Index (BEDS, 0x00))
                        }
                        Else
                        {
                            If (LEqual (_T_2, 0x02))
                            {
                                Store (0x00020000, Index (BEDS, 0x01))
                            }
                            Else
                            {
                                If (LEqual (_T_2, 0x03))
                                {
                                    Store (0x00020000, Index (BEDS, 0x02))
                                }
                                Else
                                {
                                    If (LEqual (_T_2, 0x04))
                                    {
                                        Store (0x00020000, Index (BEDS, 0x03))
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_2, 0x05))
                                        {
                                            Store (0x00020000, Index (BEDS, 0x04))
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_2, 0x06))
                                            {
                                                Store (0x00020000, Index (BEDS, 0x05))
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_2, 0x07))
                                                {
                                                    Store (0x00020000, Index (BEDS, 0x06))
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_2, 0x08))
                                                    {
                                                        Store (0x00020000, Index (BEDS, 0x07))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_2, 0x09))
                                                        {
                                                            Store (0x00020000, Index (BEDS, 0x08))
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_2, 0x0A))
                                                            {
                                                                Store (0x00020000, Index (BEDS, 0x09))
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_2, 0x0B))
                                                                {
                                                                    Store (0x00020000, Index (BEDS, 0x0A))
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_2, 0x0C))
                                                                    {
                                                                        If (LEqual (\_SB.PCI0.LPC.EC0.BDC0, 0x00))
                                                                        {
                                                                            Store (0x00030000, Index (BEDS, 0x0B))
                                                                        }
                                                                        Else
                                                                        {
                                                                            Store (0x01, \_SB.PCI0.LPC.EC0.PSRC)
                                                                            Store (0x01, Index (BEDS, 0x0B))
                                                                        }
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_2, 0x0D))
                                                                        {
                                                                            Store (0x00020000, Index (BEDS, 0x0C))
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (_T_2, 0x0E))
                                                                            {
                                                                                Store (0x01, \_SB.PCI0.LPC.EC0.SCHG)
                                                                                Store (0x01, \_SB.PCI0.LPC.EC0.SCPF)
                                                                                Store (0x01, Index (BEDS, 0x0D))
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (_T_2, 0x0F))
                                                                                {
                                                                                    Store (0x00020000, Index (BEDS, 0x0E))
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (_T_2, 0x10))
                                                                                    {
                                                                                        Store (0x00020000, Index (BEDS, 0x0F))
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                        If (LEqual (_T_2, 0x11))
                                                                                        {
                                                                                            Store (0x03E8, Index (BEDS, 0x10))
                                                                                        }
                                                                                        Else
                                                                                        {
                                                                                            If (LEqual (_T_2, 0x12))
                                                                                            {
                                                                                                Store (0x00, Index (BEDS, 0x11))
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (CKGS, 0, NotSerialized)
                {
                    Store (0x01, GSTS)
                    Return (GSTS)
                }

                Method (WSHP, 1, NotSerialized)
                {
                }

                Method (WSSL, 1, NotSerialized)
                {
                }

                Method (WSSP, 1, NotSerialized)
                {
                }

                Method (WSSE, 1, NotSerialized)
                {
                }

                Method (WSVE, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LEqual (Local0, 0x01))
                    {
                        Store (0x01, BGEF)
                    }
                    Else
                    {
                        Store (0x00, BGEF)
                    }

                    Store (0x00, Index (BGDS, 0x00))
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
                    AAF1 ()
                    Store (AADS, BUFF)
                    Return (BUFF)
                }

                Method (WMBA, 3, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (Arg1, _T_0)
                    If (LNotEqual (Match (Package (0x08)
                                    {
                                        0x01, 
                                        0x02, 
                                        0x03, 
                                        0x08, 
                                        0x09, 
                                        0x0A, 
                                        0x0C, 
                                        0x0D
                                    }, MEQ, _T_0, MTR, Zero, Zero), Ones))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        If (LNotEqual (Match (Package (0x05)
                                        {
                                            0x04, 
                                            0x05, 
                                            0x06, 
                                            0x07, 
                                            0x0B
                                        }, MEQ, _T_0, MTR, Zero, Zero), Ones))
                        {
                            If (LEqual (Arg1, 0x07))
                            {
                                Store (Arg2, BUFF)
                                If (BF00)
                                {
                                    Store (0x01, BAEF)
                                }
                            }

                            Store (0x01, Local0)
                        }
                    }

                    If (Local0)
                    {
                        WSDS (Arg1, Arg2)
                    }
                    Else
                    {
                        WGDS (Arg1)
                    }

                    Store (DerefOf (Index (BADG, Subtract (Arg1, 0x01))), BUFF)
                    Return (BUFF)
                }

                Method (_WED, 1, NotSerialized)
                {
                    If (LGreaterEqual (Arg0, 0x80))
                    {
                        If (LLess (Arg0, 0x83))
                        {
                            Return (OEMN ())
                        }
                    }
                }

                Method (WMBB, 3, NotSerialized)
                {
                    STRL (Arg1, Arg2)
                    If (LEqual (Arg1, 0x01))
                    {
                        Store (BBSB, BUFF)
                    }

                    If (LEqual (Arg1, 0x02))
                    {
                        Store (BBD1, BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBC, 3, NotSerialized)
                {
                    WODP (Arg1, Arg2)
                    If (LLess (Arg1, 0x0A))
                    {
                        Subtract (Arg1, 0x01, Local0)
                        Store (DerefOf (Index (BCDS, Subtract (Arg1, 0x01))), BUFF)
                    }
                    Else
                    {
                        ShiftRight (DerefOf (Index (BCDS, Subtract (Arg1, 0x0A))), 0x10, 
                            BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBD, 3, NotSerialized)
                {
                    If (LEqual (Arg1, 0x01))
                    {
                        Store (Arg2, BUFF)
                        Store (BUFF, Local0)
                        Store (Arg2, WIT0)
                        GCPU (WIT0)
                        Return (DSY0)
                    }

                    If (LEqual (Arg1, 0x02))
                    {
                        Store (Arg2, Local0)
                        MSRR (Arg2)
                        Return (DSY1)
                    }

                    If (LEqual (Arg1, 0x03))
                    {
                        Store (Arg2, Local0)
                        MSRW (Arg2)
                        Return (DSY1)
                    }

                    If (LEqual (Arg1, 0x04))
                    {
                        C4C3 (Arg1, Arg2)
                        ShiftRight (DerefOf (Index (BCDS, Add (Arg1, 0x05))), 0x10, 
                            BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x05))
                    {
                        C4C3 (Arg1, Arg2)
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x06))
                    {
                        CPUF ()
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x07))
                    {
                        CPUT ()
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
                        PCIR (Local0)
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
                        PCIW (Local1)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x0A))
                    {
                        CPUS ()
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x02))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x0B))
                    {
                        PCID (Arg2)
                        Return (DSY6)
                    }
                }

                Method (WMBE, 3, NotSerialized)
                {
                    BTIF (Arg1, Arg2)
                    Store (BUFF, Debug)
                    Store (BEDS, Debug)
                    Store (DerefOf (Index (BEDS, Subtract (Arg1, 0x01))), BUFF)
                    Store (BUFF, Debug)
                    Return (BUFF)
                }

                Method (WMBF, 3, NotSerialized)
                {
                    If (LGreater (Arg1, 0x04))
                    {
                        Store (0x02, BF00)
                        Store (0x00, BF01)
                        Store (0x00, BF02)
                        Store (0x00, BF03)
                        Return (BUFF)
                    }

                    If (CKGS ())
                    {
                        Store (Arg2, BUFF)
                        If (LEqual (Arg1, 0x01))
                        {
                            WSHP (BF00)
                        }
                        Else
                        {
                            If (LEqual (Arg1, 0x02))
                            {
                                WSSL (BF00)
                            }
                            Else
                            {
                                If (LEqual (Arg1, 0x03))
                                {
                                    WSSP (BF00)
                                }
                                Else
                                {
                                    WSSE (BF00)
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
                    Store (Arg2, BUFF)
                    WSVE (BF00)
                    Store (DerefOf (Index (BGDS, Subtract (Arg1, 0x01))), BUFF)
                    Store (BUFF, Debug)
                    Return (BUFF)
                }
            }
        }
    }
}

