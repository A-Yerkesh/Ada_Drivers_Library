------------------------------------------------------------------------------
--                                                                          --
--                     Copyright (C) 2015-2018, AdaCore                     --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

--  This file provides declarations for devices on the STM32G0B1 and
--  STM32G0B1 MCUs manufactured by ST Microelectronics.

with STM32_SVD;      use STM32_SVD;
with STM32.GPIO;     use STM32.GPIO;

--  TODO:
--    STM32.ADC, STM32.DAC, STM32.I2C, STM32.SPI, STM32.I2S, STM32.USARTs,
--    STM32.RTC, STM32.CRC, STM32.Timers

package STM32.Device is
   pragma Elaborate_Body;

   Unknown_Device : exception;
   --  Raised by the routines below for a device passed as an actual parameter
   --  when that device is not present on the given hardware instance.

   procedure Enable_Clock (This : aliased in out GPIO_Port)
     with Inline;
   procedure Enable_Clock (Point : GPIO_Point)
     with Inline;
   procedure Enable_Clock (Points : GPIO_Points)
     with Inline;

   procedure Reset (This : aliased in out GPIO_Port)
     with Inline;
   procedure Reset (Point : GPIO_Point)
     with Inline;
   procedure Reset (Points : GPIO_Points)
     with Inline;

   GPIO_A : aliased GPIO_Port
     with Import, Volatile, Address => GPIOA_Base;
   GPIO_B : aliased GPIO_Port
     with Import, Volatile, Address => GPIOB_Base;
   GPIO_C : aliased GPIO_Port
     with Import, Volatile, Address => GPIOC_Base;
   GPIO_D : aliased GPIO_Port
     with Import, Volatile, Address => GPIOD_Base;
   GPIO_F : aliased GPIO_Port
     with Import, Volatile, Address => GPIOF_Base;

   PA0  : aliased GPIO_Point := (GPIO_A'Access, Pin_0);
   PA1  : aliased GPIO_Point := (GPIO_A'Access, Pin_1);
   PA2  : aliased GPIO_Point := (GPIO_A'Access, Pin_2);
   PA3  : aliased GPIO_Point := (GPIO_A'Access, Pin_3);
   PA4  : aliased GPIO_Point := (GPIO_A'Access, Pin_4);
   PA5  : aliased GPIO_Point := (GPIO_A'Access, Pin_5);
   PA6  : aliased GPIO_Point := (GPIO_A'Access, Pin_6);
   PA7  : aliased GPIO_Point := (GPIO_A'Access, Pin_7);
   PA8  : aliased GPIO_Point := (GPIO_A'Access, Pin_8);
   PA9  : aliased GPIO_Point := (GPIO_A'Access, Pin_9);
   PA10 : aliased GPIO_Point := (GPIO_A'Access, Pin_10);
   PA11 : aliased GPIO_Point := (GPIO_A'Access, Pin_11);
   PA12 : aliased GPIO_Point := (GPIO_A'Access, Pin_12);
   PA13 : aliased GPIO_Point := (GPIO_A'Access, Pin_13);
   PA14 : aliased GPIO_Point := (GPIO_A'Access, Pin_14);
   PA15 : aliased GPIO_Point := (GPIO_A'Access, Pin_15);
   PB0  : aliased GPIO_Point := (GPIO_B'Access, Pin_0);
   PB1  : aliased GPIO_Point := (GPIO_B'Access, Pin_1);
   PB2  : aliased GPIO_Point := (GPIO_B'Access, Pin_2);
   PB3  : aliased GPIO_Point := (GPIO_B'Access, Pin_3);
   PB4  : aliased GPIO_Point := (GPIO_B'Access, Pin_4);
   PB5  : aliased GPIO_Point := (GPIO_B'Access, Pin_5);
   PB6  : aliased GPIO_Point := (GPIO_B'Access, Pin_6);
   PB7  : aliased GPIO_Point := (GPIO_B'Access, Pin_7);
   PB8  : aliased GPIO_Point := (GPIO_B'Access, Pin_8);
   PB9  : aliased GPIO_Point := (GPIO_B'Access, Pin_9);
   PB10 : aliased GPIO_Point := (GPIO_B'Access, Pin_10);
   PB11 : aliased GPIO_Point := (GPIO_B'Access, Pin_11);
   PB12 : aliased GPIO_Point := (GPIO_B'Access, Pin_12);
   PB13 : aliased GPIO_Point := (GPIO_B'Access, Pin_13);
   PB14 : aliased GPIO_Point := (GPIO_B'Access, Pin_14);
   PB15 : aliased GPIO_Point := (GPIO_B'Access, Pin_15);
   PC0  : aliased GPIO_Point := (GPIO_C'Access, Pin_0);
   PC1  : aliased GPIO_Point := (GPIO_C'Access, Pin_1);
   PC2  : aliased GPIO_Point := (GPIO_C'Access, Pin_2);
   PC3  : aliased GPIO_Point := (GPIO_C'Access, Pin_3);
   PC4  : aliased GPIO_Point := (GPIO_C'Access, Pin_4);
   PC5  : aliased GPIO_Point := (GPIO_C'Access, Pin_5);
   PC6  : aliased GPIO_Point := (GPIO_C'Access, Pin_6);
   PC7  : aliased GPIO_Point := (GPIO_C'Access, Pin_7);
   PC8  : aliased GPIO_Point := (GPIO_C'Access, Pin_8);
   PC9  : aliased GPIO_Point := (GPIO_C'Access, Pin_9);
   PC10 : aliased GPIO_Point := (GPIO_C'Access, Pin_10);
   PC11 : aliased GPIO_Point := (GPIO_C'Access, Pin_11);
   PC12 : aliased GPIO_Point := (GPIO_C'Access, Pin_12);
   PC13 : aliased GPIO_Point := (GPIO_C'Access, Pin_13);
   PC14 : aliased GPIO_Point := (GPIO_C'Access, Pin_14);
   PC15 : aliased GPIO_Point := (GPIO_C'Access, Pin_15);
   PD0  : aliased GPIO_Point := (GPIO_D'Access, Pin_0);
   PD1  : aliased GPIO_Point := (GPIO_D'Access, Pin_1);
   PD2  : aliased GPIO_Point := (GPIO_D'Access, Pin_2);
   PD3  : aliased GPIO_Point := (GPIO_D'Access, Pin_3);
   PD4  : aliased GPIO_Point := (GPIO_D'Access, Pin_4);
   PD5  : aliased GPIO_Point := (GPIO_D'Access, Pin_5);
   PD6  : aliased GPIO_Point := (GPIO_D'Access, Pin_6);
   PD8  : aliased GPIO_Point := (GPIO_D'Access, Pin_8);
   PD9  : aliased GPIO_Point := (GPIO_D'Access, Pin_9);
   PF0  : aliased GPIO_Point := (GPIO_F'Access, Pin_0);
   PF1  : aliased GPIO_Point := (GPIO_F'Access, Pin_1);
   PF2  : aliased GPIO_Point := (GPIO_F'Access, Pin_2);

   --  Peripheral-wide alternate function indices
   GPIO_AF_TIM2_2 : constant GPIO_Alternate_Function;
   GPIO_AF_TIM3_1 : constant GPIO_Alternate_Function;
   GPIO_AF_TIM4_9 : constant GPIO_Alternate_Function;
   GPIO_AF_I2C1_6 : constant GPIO_Alternate_Function;

   --  Pin-specific alternate function indices
   GPIO_AF_I2C2_SCL_PA11         : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SCL_PA7          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SCL_PA9          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SCL_PB10         : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SCL_PB13         : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SCL_PB3          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SDA_PA10         : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SDA_PA12         : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SDA_PA6          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SDA_PB11         : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SDA_PB14         : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SDA_PB4          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SMBA_PA15        : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_SMBA_PB12        : constant GPIO_Alternate_Function;
   GPIO_AF_I2C3_SCL_PA7          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C3_SCL_PB3          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C3_SCL_PC0          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C3_SDA_PA6          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C3_SDA_PB4          : constant GPIO_Alternate_Function;
   GPIO_AF_I2C3_SDA_PC1          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_CK_PA1           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_CK_PA5           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_CK_PB3           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_CK_PD8           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_MCK_PA11         : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_MCK_PA6          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_MCK_PB4          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_MCK_PD5          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_SD_PA12          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_SD_PA2           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_SD_PA7           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_SD_PB5           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_SD_PD6           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_WS_PA15          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_WS_PA4           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_WS_PB0           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S1_WS_PD9           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_CK_PA0           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_CK_PB10          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_CK_PB13          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_CK_PB8           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_CK_PD1           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_MCK_PA3          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_MCK_PA9          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_MCK_PB14         : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_MCK_PB2          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_MCK_PB6          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_MCK_PC2          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_MCK_PD3          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_SD_PA10          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_SD_PA4           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_SD_PB11          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_SD_PB15          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_SD_PB7           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_SD_PC3           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_SD_PD4           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_WS_PA8           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_WS_PB12          : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_WS_PB9           : constant GPIO_Alternate_Function;
   GPIO_AF_I2S2_WS_PD0           : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_MISO_PA11        : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_MISO_PA6         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_MISO_PB4         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_MISO_PD5         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_MOSI_PA12        : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_MOSI_PA2         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_MOSI_PA7         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_MOSI_PB5         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_MOSI_PD6         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_NSS_PA15         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_NSS_PA4          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_NSS_PB0          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_NSS_PD9          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_SCK_PA1          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_SCK_PA5          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_SCK_PB3          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_SCK_PD8          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MISO_PA3         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MISO_PA9         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MISO_PB14        : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MISO_PB2         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MISO_PB6         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MISO_PC2         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MISO_PD3         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MOSI_PA10        : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MOSI_PA4         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MOSI_PB11        : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MOSI_PB15        : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MOSI_PB7         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MOSI_PC3         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_MOSI_PD4         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_NSS_PA8          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_NSS_PB12         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_NSS_PB9          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_NSS_PD0          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_SCK_PA0          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_SCK_PB10         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_SCK_PB13         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_SCK_PB8          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_SCK_PD1          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_MISO_PB4         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_MISO_PC11        : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_MOSI_PB5         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_MOSI_PC12        : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_NSS_PA15         : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_NSS_PA4          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_SCK_PB3          : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_SCK_PC10         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM14_CH1_PA4         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM14_CH1_PA7         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM14_CH1_PB1         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM14_CH1_PC12        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM14_CH1_PF0         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_BKIN_PA9        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_BKIN_PB12       : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_BKIN_PB8        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_BKIN_PC15       : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH1_PA2         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH1_PB14        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH1_PC1         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH1N_PA1        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH1N_PB13       : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH1N_PB15       : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH1N_PF1        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH2_PA3         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH2_PB15        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_CH2_PC2         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM16_BKIN_PB5        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM16_CH1_PA6         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM16_CH1_PB8         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM16_CH1_PD0         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM16_CH1N_PB6        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM17_BKIN_PA10       : constant GPIO_Alternate_Function;
   GPIO_AF_TIM17_BKIN_PB4        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM17_CH1_PA7         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM17_CH1_PB9         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM17_CH1_PD1         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM17_CH1N_PB7        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_BKIN_PA6         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_BKIN_PB12        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_BKIN_PC13        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_BKIN_PD5         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_BKIN2_PA11       : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_BKIN2_PC14       : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_BKIN2_PD9        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH1_PA8          : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH1_PC8          : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH1N_PA7         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH1N_PB13        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH1N_PD2         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH2_PA9          : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH2_PB3          : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH2_PC9          : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH2N_PB0         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH2N_PB14        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH2N_PD3         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH3_PA10         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH3_PB6          : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH3_PC10         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH3N_PB1         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH3N_PB15        : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH3N_PD4         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH4_PA11         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_CH4_PC11         : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_ETR_PA12         : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_CTS_PA11       : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_CTS_PB4        : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_RTS_DE_CK_PA12 : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_RTS_DE_CK_PB3  : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_RX_PA10        : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_RX_PB7         : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_RX_PC5         : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_TX_PA9         : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_TX_PB6         : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_TX_PC4         : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_CTS_PA0        : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_CTS_PD3        : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_RTS_DE_CK_PA1  : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_RTS_DE_CK_PD4  : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_RX_PA15        : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_RX_PA3         : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_RX_PD6         : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_TX_PA14        : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_TX_PA2         : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_TX_PD5         : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_CTS_PA6        : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_CTS_PB13       : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RTS_DE_CK_PA15 : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RTS_DE_CK_PB1  : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RTS_DE_CK_PB14 : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RTS_DE_CK_PD2  : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RX_PB0         : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RX_PB11        : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RX_PB9         : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RX_PC11        : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RX_PC5         : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_RX_PD9         : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_TX_PA5         : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_TX_PB10        : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_TX_PB2         : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_TX_PB8         : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_TX_PC10        : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_TX_PC4         : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_TX_PD8         : constant GPIO_Alternate_Function;
   GPIO_AF_USART4_CTS_PB7        : constant GPIO_Alternate_Function;
   GPIO_AF_USART4_RTS_DE_CK_PA15 : constant GPIO_Alternate_Function;
   GPIO_AF_USART4_RX_PA1         : constant GPIO_Alternate_Function;
   GPIO_AF_USART4_RX_PC11        : constant GPIO_Alternate_Function;
   GPIO_AF_USART4_TX_PA0         : constant GPIO_Alternate_Function;
   GPIO_AF_USART4_TX_PC10        : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_CTS_PB6        : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_CTS_PD5        : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_RTS_DE_CK_PB5  : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_RTS_DE_CK_PD4  : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_RX_PB1         : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_RX_PB4         : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_RX_PD2         : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_TX_PB0         : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_TX_PB3         : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_TX_PC12        : constant GPIO_Alternate_Function;
   GPIO_AF_USART5_TX_PD3         : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_CTS_PA6        : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_CTS_PB15       : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_RTS_DE_CK_PA7  : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_RTS_DE_CK_PB14 : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_RX_PA5         : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_RX_PB9         : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_RX_PC1         : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_TX_PA4         : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_TX_PB8         : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_TX_PC0         : constant GPIO_Alternate_Function;

private
   GPIO_AF_TIM2_2                : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM3_1                : constant GPIO_Alternate_Function := 1;
   GPIO_AF_TIM4_9                : constant GPIO_Alternate_Function := 9;
   GPIO_AF_I2C1_6                : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C2_SCL_PA11         : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C2_SCL_PA7          : constant GPIO_Alternate_Function := 8;
   GPIO_AF_I2C2_SCL_PA9          : constant GPIO_Alternate_Function := 8;
   GPIO_AF_I2C2_SCL_PB10         : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C2_SCL_PB13         : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C2_SCL_PB3          : constant GPIO_Alternate_Function := 8;
   GPIO_AF_I2C2_SDA_PA10         : constant GPIO_Alternate_Function := 8;
   GPIO_AF_I2C2_SDA_PA12         : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C2_SDA_PA6          : constant GPIO_Alternate_Function := 8;
   GPIO_AF_I2C2_SDA_PB11         : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C2_SDA_PB14         : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C2_SDA_PB4          : constant GPIO_Alternate_Function := 8;
   GPIO_AF_I2C2_SMBA_PA15        : constant GPIO_Alternate_Function := 8;
   GPIO_AF_I2C2_SMBA_PB12        : constant GPIO_Alternate_Function := 8;
   GPIO_AF_I2C3_SCL_PA7          : constant GPIO_Alternate_Function := 9;
   GPIO_AF_I2C3_SCL_PB3          : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C3_SCL_PC0          : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C3_SDA_PA6          : constant GPIO_Alternate_Function := 9;
   GPIO_AF_I2C3_SDA_PB4          : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C3_SDA_PC1          : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2S1_CK_PA1           : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_CK_PA5           : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_CK_PB3           : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_CK_PD8           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S1_MCK_PA11         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_MCK_PA6          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_MCK_PB4          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_MCK_PD5          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S1_SD_PA12          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_SD_PA2           : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_SD_PA7           : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_SD_PB5           : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_SD_PD6           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S1_WS_PA15          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_WS_PA4           : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_WS_PB0           : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S1_WS_PD9           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_CK_PA0           : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S2_CK_PB10          : constant GPIO_Alternate_Function := 5;
   GPIO_AF_I2S2_CK_PB13          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S2_CK_PB8           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_CK_PD1           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_MCK_PA3          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S2_MCK_PA9          : constant GPIO_Alternate_Function := 4;
   GPIO_AF_I2S2_MCK_PB14         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S2_MCK_PB2          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_MCK_PB6          : constant GPIO_Alternate_Function := 4;
   GPIO_AF_I2S2_MCK_PC2          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_MCK_PD3          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_SD_PA10          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S2_SD_PA4           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_SD_PB11          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S2_SD_PB15          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S2_SD_PB7           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_SD_PC3           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_SD_PD4           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_WS_PA8           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_I2S2_WS_PB12          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_I2S2_WS_PB9           : constant GPIO_Alternate_Function := 5;
   GPIO_AF_I2S2_WS_PD0           : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI1_MISO_PA11        : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_MISO_PA6         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_MISO_PB4         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_MISO_PD5         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI1_MOSI_PA12        : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_MOSI_PA2         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_MOSI_PA7         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_MOSI_PB5         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_MOSI_PD6         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI1_NSS_PA15         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_NSS_PA4          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_NSS_PB0          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_NSS_PD9          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI1_SCK_PA1          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_SCK_PA5          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_SCK_PB3          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI1_SCK_PD8          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_MISO_PA3         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI2_MISO_PA9         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_SPI2_MISO_PB14        : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI2_MISO_PB2         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_MISO_PB6         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_SPI2_MISO_PC2         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_MISO_PD3         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_MOSI_PA10        : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI2_MOSI_PA4         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_MOSI_PB11        : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI2_MOSI_PB15        : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI2_MOSI_PB7         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_MOSI_PC3         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_MOSI_PD4         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_NSS_PA8          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_NSS_PB12         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI2_NSS_PB9          : constant GPIO_Alternate_Function := 5;
   GPIO_AF_SPI2_NSS_PD0          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_SCK_PA0          : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI2_SCK_PB10         : constant GPIO_Alternate_Function := 5;
   GPIO_AF_SPI2_SCK_PB13         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SPI2_SCK_PB8          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI2_SCK_PD1          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SPI3_MISO_PB4         : constant GPIO_Alternate_Function := 9;
   GPIO_AF_SPI3_MISO_PC11        : constant GPIO_Alternate_Function := 4;
   GPIO_AF_SPI3_MOSI_PB5         : constant GPIO_Alternate_Function := 9;
   GPIO_AF_SPI3_MOSI_PC12        : constant GPIO_Alternate_Function := 4;
   GPIO_AF_SPI3_NSS_PA15         : constant GPIO_Alternate_Function := 9;
   GPIO_AF_SPI3_NSS_PA4          : constant GPIO_Alternate_Function := 9;
   GPIO_AF_SPI3_SCK_PB3          : constant GPIO_Alternate_Function := 9;
   GPIO_AF_SPI3_SCK_PC10         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_TIM14_CH1_PA4         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_TIM14_CH1_PA7         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_TIM14_CH1_PB1         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_TIM14_CH1_PC12        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM14_CH1_PF0         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM15_BKIN_PA9        : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM15_BKIN_PB12       : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM15_BKIN_PB8        : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM15_BKIN_PC15       : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM15_CH1_PA2         : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM15_CH1_PB14        : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM15_CH1_PC1         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM15_CH1N_PA1        : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM15_CH1N_PB13       : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM15_CH1N_PB15       : constant GPIO_Alternate_Function := 4;
   GPIO_AF_TIM15_CH1N_PF1        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM15_CH2_PA3         : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM15_CH2_PB15        : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM15_CH2_PC2         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM16_BKIN_PB5        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM16_CH1_PA6         : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM16_CH1_PB8         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM16_CH1_PD0         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM16_CH1N_PB6        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM17_BKIN_PA10       : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM17_BKIN_PB4        : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM17_CH1_PA7         : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM17_CH1_PB9         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM17_CH1_PD1         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM17_CH1N_PB7        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_BKIN_PA6         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_BKIN_PB12        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_BKIN_PC13        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_BKIN_PD5         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_BKIN2_PA11       : constant GPIO_Alternate_Function := 5;
   GPIO_AF_TIM1_BKIN2_PC14       : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_BKIN2_PD9        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH1_PA8          : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH1_PC8          : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH1N_PA7         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH1N_PB13        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH1N_PD2         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH2_PA9          : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH2_PB3          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_TIM1_CH2_PC9          : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH2N_PB0         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH2N_PB14        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH2N_PD3         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH3_PA10         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH3_PB6          : constant GPIO_Alternate_Function := 1;
   GPIO_AF_TIM1_CH3_PC10         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH3N_PB1         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH3N_PB15        : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH3N_PD4         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH4_PA11         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_CH4_PC11         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM1_ETR_PA12         : constant GPIO_Alternate_Function := 2;
   GPIO_AF_USART1_CTS_PA11       : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART1_CTS_PB4        : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART1_RTS_DE_CK_PA12 : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART1_RTS_DE_CK_PB3  : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART1_RX_PA10        : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART1_RX_PB7         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART1_RX_PC5         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART1_TX_PA9         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART1_TX_PB6         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART1_TX_PC4         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART2_CTS_PA0        : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART2_CTS_PD3        : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART2_RTS_DE_CK_PA1  : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART2_RTS_DE_CK_PD4  : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART2_RX_PA15        : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART2_RX_PA3         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART2_RX_PD6         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART2_TX_PA14        : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART2_TX_PA2         : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART2_TX_PD5         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART3_CTS_PA6        : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_CTS_PB13       : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_RTS_DE_CK_PA15 : constant GPIO_Alternate_Function := 5;
   GPIO_AF_USART3_RTS_DE_CK_PB1  : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_RTS_DE_CK_PB14 : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_RTS_DE_CK_PD2  : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART3_RX_PB0         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_RX_PB11        : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_RX_PB9         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_RX_PC11        : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART3_RX_PC5         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART3_RX_PD9         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART3_TX_PA5         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_TX_PB10        : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_TX_PB2         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_TX_PB8         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART3_TX_PC10        : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART3_TX_PC4         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART3_TX_PD8         : constant GPIO_Alternate_Function := 0;
   GPIO_AF_USART4_CTS_PB7        : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART4_RTS_DE_CK_PA15 : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART4_RX_PA1         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART4_RX_PC11        : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART4_TX_PA0         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART4_TX_PC10        : constant GPIO_Alternate_Function := 1;
   GPIO_AF_USART5_CTS_PB6        : constant GPIO_Alternate_Function := 8;
   GPIO_AF_USART5_CTS_PD5        : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART5_RTS_DE_CK_PB5  : constant GPIO_Alternate_Function := 8;
   GPIO_AF_USART5_RTS_DE_CK_PD4  : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART5_RX_PB1         : constant GPIO_Alternate_Function := 8;
   GPIO_AF_USART5_RX_PB4         : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART5_RX_PD2         : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART5_TX_PB0         : constant GPIO_Alternate_Function := 8;
   GPIO_AF_USART5_TX_PB3         : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART5_TX_PC12        : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART5_TX_PD3         : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART6_CTS_PA6        : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART6_CTS_PB15       : constant GPIO_Alternate_Function := 8;
   GPIO_AF_USART6_RTS_DE_CK_PA7  : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART6_RTS_DE_CK_PB14 : constant GPIO_Alternate_Function := 8;
   GPIO_AF_USART6_RX_PA5         : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART6_RX_PB9         : constant GPIO_Alternate_Function := 8;
   GPIO_AF_USART6_RX_PC1         : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART6_TX_PA4         : constant GPIO_Alternate_Function := 3;
   GPIO_AF_USART6_TX_PB8         : constant GPIO_Alternate_Function := 8;
   GPIO_AF_USART6_TX_PC0         : constant GPIO_Alternate_Function := 4;
end STM32.Device;